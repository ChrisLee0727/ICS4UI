//
//  main.swift
//  ChrisLU3-4A1Q2
//  ICS4UI _ ChrisLU3_4A1Q2
//  Ms. Harris
//
//  Created by Chris Lee on 11/05/2019.
//  Copyright © 2019 ChrisLee. All rights reserved.
//

//import foundation and declare variables
import Foundation

var int = [Int]()
var dou = [Double]()
var neg = [Any]()
var check: Bool = false

//UI
print("Please Insert Your Numbers which are Negative, Positivel, Integer, and Doubles")
print("And, It will sort the numbers by each type\r")

let rawString = readLine()?.components(separatedBy: " ") // readLine() is for gathering user's numbers and make it separate by space blank

if let numbers = rawString { // debug system
    
    let count = numbers.count
    print("\rYou inserted \(numbers).") // display user's numbers
    
    for i in 0..<(count) { //for loop
        if let number = Double(numbers[i]) {// assume that user insert doubles for checking
            if ( 0 < number || 0 == number) { // check the number is + or -
                if ( number.truncatingRemainder(dividingBy: 1) == 0 ) { // check the number is int
                    int.append(Int(number)) // append on int() as Int
                }
                else { // else it would be double
                    dou.append(number) //append on double()
                }
            }
            else { // else it would be negative
                neg.append(String(number)) //append on number()
            }
        } else {
            check = true;
        }
    }
    if check {
        print("\rPlease re-input your numbers")
    }
    else {
        print("\rPositive Int: \(int)")
        print("Positive Double: \(dou)")
        print("Negative Numbers: \(neg)")

    }

}

