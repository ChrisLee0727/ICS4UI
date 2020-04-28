//
//  ViewController.swift
//  ChrisLu2A1Q1
//
//  Created by Chris Lee on 06/04/2019.
//  Copyright © 2019 ChrisLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // set variables and references
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieNameTextField: UITextField!
    @IBOutlet weak var movieRateLabel: UILabel!
    @IBOutlet weak var movieList: UITextView!
    
    var movieDict = ["Eternal Sunshine": 4.5, "Iron Man 3": 4.3, "The Devil Wears Prada": 4.0, "John Wick": 4.1, "The Truman Show": 4.3]
    
    // function show is for denoting the movie list to user via UI
    func show(){
        var string = ""
        var count = 1
        for (name, rate) in movieDict {
            string += String(count) + ". " + name + ": " + String(rate) + "\r"
            count += 1
        }
        movieList.text = string
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    @IBAction func editChanged(_ sender: Any) { // if edit changed
        if (movieNameTextField.text?.lowercased() == "eternal sunshine" || movieNameTextField.text == "1") {
            movieNameLabel.text = "Eternal Sunshine"
            movieRateLabel.text = String(movieDict["Eternal Sunshine"]!)//show the rate
        }
            
        else if (movieNameTextField.text?.lowercased() == "iron man 3" || movieNameTextField.text == "2") {
            movieNameLabel.text = "Iron Man 3"
            movieRateLabel.text = String(movieDict["Iron Man 3"]!)//show the rate
        }
            
        else if (movieNameTextField.text?.lowercased() == "the devil wears prada" || movieNameTextField.text == "3") {
            movieNameLabel.text = "The Devil Wears Prada"
            movieRateLabel.text = String(movieDict["The Devil Wears Prada"]!)//show the rate
        }
            
        else if (movieNameTextField.text?.lowercased() == "john wick" || movieNameTextField.text == "4") {
            movieNameLabel.text = "John Wick"
            movieRateLabel.text = String(movieDict["John Wick"]!) //show the rate
            
        }
            
        else if (movieNameTextField.text?.lowercased() == "the truman show" || movieNameTextField.text == "5") {
            movieNameLabel.text = "The Truman Show"
            movieRateLabel.text = String(movieDict["The Truman Show"]!) //show the rate
        }
        
        else { //nothing
            movieNameLabel.text = "Movie Name with Rating"
            movieRateLabel.text = "Rating"
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        if (movieNameTextField.text?.lowercased() == "eternal sunshine" || movieNameTextField.text == "1") {
            movieNameLabel.text = "Eternal Sunshine"
            movieRateLabel.text = String(movieDict["Eternal Sunshine"]!) //show the rate
        }
            
        else if (movieNameTextField.text?.lowercased() == "iron man 3" || movieNameTextField.text == "2") {
            movieNameLabel.text = "Iron Man 3"
            movieRateLabel.text = String(movieDict["Iron Man 3"]!) //show the rate
        }
            
        else if (movieNameTextField.text?.lowercased() == "the devil wears prada" || movieNameTextField.text == "3") {
            movieNameLabel.text = "The Devil Wears Prada"
            movieRateLabel.text = String(movieDict["The Devil Wears Prada"]!) //show the rate
        }
            
        else if (movieNameTextField.text?.lowercased() == "john wick" || movieNameTextField.text == "4") {
            movieNameLabel.text = "John Wick"
            movieRateLabel.text = String(movieDict["John Wick"]!)  //show the rate
            
        }
            
        else if (movieNameTextField.text?.lowercased() == "the truman show" || movieNameTextField.text == "5") {
            movieNameLabel.text = "The Truman Show"
            movieRateLabel.text = String(movieDict["The Truman Show"]!) //show the rate
        }
            
        else if (movieNameTextField.text!.contains("/")){ // if text contains "/", add the movie with its rate
            var name = movieNameTextField.text!.split(separator: "/", maxSplits: 1)[0]
            var rate = movieNameTextField.text!.split(separator: "/", maxSplits: 1)[1]
            movieDict[String(name)] = Double(rate)
            print(movieDict)
            show()
        }
        else { //nothing
            movieNameLabel.text = "Movie Name with Rating"
            movieRateLabel.text = "Rating"
        }
    }
}

