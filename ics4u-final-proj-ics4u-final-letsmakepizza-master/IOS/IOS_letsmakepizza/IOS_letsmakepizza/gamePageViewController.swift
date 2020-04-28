//
//  playPageViewController.swift
//  IOS_letsmakepizza
//
//  Created by Chris Lee on 24/05/2019.
//  Copyright © 2019 ICS4UI. All rights reserved.
//

import UIKit

class gamePageViewController: UIViewController {
    let easyIngredientsArray = ["blackOlives" , "blackOlives" , "tomatoes" , "pineapple" , "cheese" , "cheese" , "onion" , "pepperoni" , "pepperoni" , "mushroom" , "redPepper"]
    let mediumIngredientsArray = ["blackOlives" , "blackOlives" , "tomatoes" , "tomatoes" , "pineapple" , "pineapple" , "cheese" , "cheese" , "cheese" , "onion" , "pepperoni" , "pepperoni" , "mushroom" , "redPepper" , "ham" , "ham" , "greenOlives" , "greenOlives" , "bacon" , "greenPepper"]
    let hardIngredientsArray = ["blackOlives" , "blackOlives" , "tomatoes" , "tomatoes" , "tomatoes" , "pineapple" , "pineapple" , "cheese" , "cheese" , "cheese" , "cheese" , "Onion" , "pepperoni" , "pepperoni" , "mushroom" , "mushroom" , "redPepper" , "ham" , "ham" , "greenOlives" , "greenOlives" , "bacon" , "bacon" , "greenPepper" , "cucumber"]
    var number_of_oven = 0
    var currentPlayerNumber = 1
    
    @IBOutlet weak var easyButton1: UIButton!
    @IBOutlet weak var easyButton2: UIButton!
    @IBOutlet weak var easyButton3: UIButton!
    @IBOutlet weak var easyButton4: UIButton!
    @IBOutlet weak var easyButton5: UIButton!
    @IBOutlet weak var easyButton6: UIButton!
    @IBOutlet weak var easyButton7: UIButton!
    @IBOutlet weak var easyButton8: UIButton!
    @IBOutlet weak var easyButton9: UIButton!
    @IBOutlet weak var easyButton10: UIButton!
    @IBOutlet weak var easyButton11: UIButton!
    
    @IBOutlet weak var easyButton12: UIButton!
    @IBOutlet weak var easyButton13: UIButton!
    @IBOutlet weak var easyButton15: UIButton!
    @IBOutlet weak var easyButton14: UIButton!
    @IBOutlet weak var easyButton16: UIButton!

    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var ovenNumberLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        let playerString = "Player: " + String(currentPlayerNumber)
        let ovenString = "Oven: " + String(number_of_oven) + "/5"
        
        super.viewDidLoad()
        playerNumberLabel.text = playerString
        ovenNumberLabel.text = ovenString
        statusLabel.text = "Hand"
    }

    @IBAction func endTurnClicked(_ sender: Any) {
        if currentPlayerNumber < number_of_players {
            currentPlayerNumber += 1
        } else {
            currentPlayerNumber = 1
        }
    }
    

}
