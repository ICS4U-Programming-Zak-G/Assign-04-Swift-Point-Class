//
//  Main.swift
//
//  Created by Zak Goneau
//  Created on 2025-05-22
//  Version 1.0
//  Copyright (c) 2025 Zak Goneau. All rights reserved.
//
//  This is the main file for the point class program

// Import library
import Foundation

// Define main function
func main(){

    // Declare constants
    let MAX: Float = 50.0
    let MIN: Float = 0.0

    // Introduce program to user
    print("This program calculates the distance from the origin to a random "
        + "point as well as the distance from that point to a user inputted point!")

    // Generate random number for x
    var x = Float.random(in: MIN...MAX)

    // Round x-value
    x = (x * 100).rounded() / 100

    // Generate random number for y
    var y = Float.random(in: MIN...MAX)

    // Round y-value
    y = (y * 100).rounded() / 100

    // Create instance of a point
    let coordinate = Point(x: x, y: y)

    // Print point
    print("The coordinate is: (\(x), \(y))")

    // call method to calculate distance from origin
    var distance = coordinate.distanceOrigin()

    // Round distance to two decimal places
    distance = (distance * 100).rounded() / 100

    // Print distance to console
    print("The distance from the origin to the point is: \(distance) units")

    // Get user input for x-value
    print("Please enter a x-value: ")

    // Try casting input to a float
    guard let xInput = readLine(), let xValue = Float(xInput) else {
        // Print error message
        print("Your x-value must be a number")

        // Exit program
        exit(1)
    }

    // Get user input for y-value
    print("Please enter a y-value: ")

    // Try casting input to float
    guard let yInput = readLine(), let yValue = Float(yInput) else {
        // Print error message
        print("Your y-value must be a number")

        // Exit program
        exit(1)
    }

    // Create second point instance
    let userPoint = UserPoint(x: xValue, y: yValue)

    // Call method to calculate distance between both points
    var distanceResult = userPoint.PTPDistance(xValue: x, yValue: y)

    // Round distance
    distanceResult = (distanceResult * 100).rounded() / 100

    // Print distance between points
    print(" The distance between (\(x), \(y)) and (\(xValue), \(yValue)) is \(distanceResult)")
}

//
//  Point.swift
//
//  Created by Zak Goneau
//  Created on 2025-05-22
//  Version 1.0
//  Copyright (c) 2025 Zak Goneau. All rights reserved.
//
//  This is the point class for the point program

// Define point class
class Point {
    // Declare attributes
    var x: Float
    var y: Float
    var distance: Float = 0

    // Constructor for point
    init(x: Float, y: Float) {
        // Set default values
        self.x = x
        self.y = y
    }

    // Method to print student information
    func distanceOrigin() -> Float {
        // Calculate distance
        distance = sqrt(pow(x, 2) + pow(y, 2))

        // Return distance
        return distance
    }
}

class UserPoint: Point {
    // Call other initializer, from parent class
    override init(x: Float, y: Float) {
        // Initializes the user point subclass
        super.init(x: x, y: y)
    }

    // Method for calculating distance from point to point
    func PTPDistance(xValue: Float, yValue: Float) -> Float {
        // Calculate distance
        distance = sqrt(pow((xValue - x), 2) + pow((yValue - y), 2))

        // Return distance
        return distance
    }
}

// Call main
main()