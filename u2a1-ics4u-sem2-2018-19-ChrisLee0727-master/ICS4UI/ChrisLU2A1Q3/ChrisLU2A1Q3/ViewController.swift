//
//  ViewController.swift
//  ChrisLU2A1Q3
//
//  Created by Chris Lee on 07/04/2019.
//  Copyright © 2019 ChrisLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // set variables
    var bucketList = [String]()
    var doneList = [String]()
    
    @IBOutlet weak var bucketTextView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var helpingLabel: UILabel!
    
    let Instructions = "If you enter the bucket list, it will be added. \rIf you enter a number of the bucket list, it will be removed\r\r;sum N summary: it is for making summary of your bucket list when you've done (e.g. ;sum 1 I loved)\r;com list: it is for comparing with owner's bucket list (e.g. ;com sky diving)"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helpingLabel.text = Instructions
        // Do any additional setup after loading the view.
    }
    
    func checkRedundant(text: String) -> Bool{ //func to check redundant text
        var count = 0
        for value in bucketList {
            if (text == value) {
                count += 1
            }
        }
        if (count != 0) {
            return false // if there was a redundant text, return false
        } else {
            return true // if it wasn't, return tru
        }
    }
    
    func ready(text: String) {
        if (Int(text) != nil) {
            
            //debug section
            if (text.isEmpty) { // This section is for preventing out of range error if user enter the number even though there are no list
                helpingLabel.text = "Please enter bucket list first"
            }
                
            else if ((Int(text)!) > bucketList.count || Int(text)! == 0 || Int(text)! < 0) { // This section is for preventing out of range error if user enter wrong number.
                helpingLabel.text = "Please enter correct number"
            }
                
                
            else if ((Int(text)! - 1 ) < bucketList.count) { // acceptable number -> acceptable result
                bucketList.remove(at: Int(text)! - 1)
                helpingLabel.text = Instructions
            }
            
        }
        //Advanced Commands
            
        else if (text.hasPrefix(";sum")) { //create summary
            if (bucketList.count != 0) { //debug system
                //ser varibales
                let numberRAW = Array(text)[5]
                let number = Int(String(numberRAW))
                
                let summaryRAW = Array(text.split(separator: " ", maxSplits: 2))[2]
                let summary = String(summaryRAW)
                
                if ((number! - 1) < bucketList.count) { // accetable number
                    doneList.append("Done: " + bucketList[number! - 1] + ": " + summary)
                    bucketList.remove(at: number! - 1)
                } else { // not acceptable number
                    helpingLabel.text = "Please enter correct number"
                }
            } else { // if there is no list
                helpingLabel.text = "Please enter your bucket list first"
            }
        }
        
        else if (text.hasPrefix(";com")) { //comparing
            if (bucketList.count != 0) { // debug system
                let comRaw = Array(text.split(separator: " ", maxSplits: 1))[1]
                let com = String(comRaw)
                
                if (checkRedundant(text: com) == false) { // same
                    helpingLabel.text = "You have the same bucket list with the owner!"
                } else { //not same
                    helpingLabel.text = "You don't have same bucket list with the owner!"
                }
            } else { // if there is no list
                helpingLabel.text = "Please enter your bucket list first"
            }
            
        }
        else {
    
            //Debug section
            if (text.isEmpty) { // if textfield is empty
                helpingLabel.text = "Please write your bucket list first"
            }
            else if (checkRedundant(text: text) == false) { // if there are redundant elements
                helpingLabel.text = "That bucket list is already exist"
            }
            else { // if it is acceptable
                bucketList.append(text)
                helpingLabel.text = Instructions
                
            }
            
        }

    }
        
    func represent() {
        //set variables
        var string = ""
        var count = 1
        for value in bucketList {
            string += String(count) + ". " + value + "\r" // if we remove second element of bucket list without this count, order will be 1, 3.
            count += 1                                    // Therefore, declare the bucket list again as string and appropriate order.
                
        }
        for value in doneList {
            string += value + "\r"
        }
        bucketTextView.text = string
        textField.text = ""
        
    }
        
    //if button clicked
    @IBAction func buttonClicked(_ sender: Any) {
        
        ready(text: textField.text!) // call ready function
        represent() // call represent function
        
    }
        
    //if edit end
    @IBAction func editEnd(_ sender: Any) {
        
        ready(text: textField.text!) // call ready function
            
        represent() // call represent function
            
            
    }
    
}
