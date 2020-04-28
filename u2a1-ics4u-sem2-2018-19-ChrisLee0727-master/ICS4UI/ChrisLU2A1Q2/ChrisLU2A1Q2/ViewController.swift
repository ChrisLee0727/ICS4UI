//
//  ViewController.swift
//  ChrisLU2A1Q2
//
//  Created by Chris Lee on 06/04/2019.
//  Copyright © 2019 ChrisLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var point = 0

    @IBOutlet weak var dice1Image: UIImageView!
    @IBOutlet weak var dice2Image: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func rollClicked(_ sender: Any) {
        
        //set random number to dice 1 & 2
        let dice1 = arc4random_uniform(6) + 1
        let dice2 = arc4random_uniform(6) + 1
        
        //set exact image to dice 1 & 2
        dice1Image.image = UIImage(named: "Dice\(dice1)")
        dice2Image.image = UIImage(named: "Dice\(dice2)")
        
        let sum = dice1 + dice2
        if (count == 0) {
            if (sum == 2 || sum == 3 || sum == 12 || sum == 7 || sum == 11){ // classify special numbers
                scoreLabel.text = "Your initial dice point is \(dice1) + \(dice2) = \(sum)" // print first dice
                
                if (sum == 2 || sum == 3 || sum == 12) { // numbers which are craps, loss
                    scoreLabel.text = "Craps, you lose"
                    
                } else {
                    scoreLabel.text = "Natural, you win" // other number(7, 11) which are natural, win
                    
                }
            } else {
                point = Int(sum) // point: 4, 5, 6, 8, 9, 10
                
                //show the point
                pointLabel.text = "\(point)"
                scoreLabel.text = "Your initial dice point is: \(dice1) + \(dice2) = \(sum)"
                count = 1
            }
        } else if (count == 1) {
            
            let dice1 = arc4random_uniform(6) + 1
            let dice2 = arc4random_uniform(6) + 1
            // set dice, random int (1~6) and random int(1~6)
            
            let sum = dice1 + dice2 // sum
            
            //set image for dices
            dice1Image.image = UIImage(named: "Dice\(dice1)")
            dice2Image.image = UIImage(named: "Dice\(dice2)")
            
            scoreLabel.text = "\nNew roll: \(dice1) + \(dice2) = \(sum)" // print new roll until break
            
            if (sum == point) { // if you got same sum of dice and point, win
                scoreLabel.text = "You got point, won"
                count = 0  // break out of loop, a win
            }
            else if (sum == 7) { // if you got 7, loss
                scoreLabel.text = "Lost with 7"
                count = 0  // break out of loop, a loss
            } else {
                scoreLabel.text = "Roll again" // others, roll again
            }
        }
        
        
    }
    

}

