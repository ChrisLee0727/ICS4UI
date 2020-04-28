//
//  difficultyMenuViewController.swift
//  IOS_letsmakepizza
//
//  Created by Chris Lee on 24/05/2019.
//  Copyright © 2019 ICS4UI. All rights reserved.
//

import UIKit


class difficultyMenuViewController: UIViewController {
    @IBOutlet weak var easyBtn: UIButton!
    @IBOutlet weak var mediumBtn: UIButton!
    @IBOutlet weak var hardBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        easyBtn.tintColor = UIColor.yellow
        easyBtn.layer.masksToBounds = true
        easyBtn.layer.cornerRadius = 10
        easyBtn.layer.borderWidth = 2
        easyBtn.layer.borderColor = UIColor.yellow.cgColor
        mediumBtn.tintColor = UIColor.yellow
        mediumBtn.layer.masksToBounds = true
        mediumBtn.layer.cornerRadius = 10
        mediumBtn.layer.borderWidth = 2
        mediumBtn.layer.borderColor = UIColor.yellow.cgColor
        hardBtn.tintColor = UIColor.yellow
        hardBtn.layer.masksToBounds = true
        hardBtn.layer.cornerRadius = 10
        hardBtn.layer.borderWidth = 2
        hardBtn.layer.borderColor = UIColor.yellow.cgColor
        // Do any additional setup after loading the view.
    }
    @IBAction func easySelected(_ sender: Any) {
        difficulty = "easy"
        cards_on_the_ground = easyIngredients
        makeListrandom()
        devideList()
        print("Difficulty: " + difficulty)
        print(card_list_for_table_view)
        playSound("button-click", "mp3")
    }
    @IBAction func mediumSelected(_ sender: Any) {
        difficulty = "medium"
        cards_on_the_ground = mediumIngredients
        makeListrandom()
        devideList()
        print("Difficulty: " + difficulty)
        print(card_list_for_table_view)
        playSound("button-click", "mp3")
    }
    @IBAction func hardSelected(_ sender: Any) {
        difficulty = "hard"
        cards_on_the_ground = hardIngredients
        makeListrandom()
        devideList()
        print("Difficulty: " + difficulty)
        print(card_list_for_table_view)
        playSound("button-click", "mp3")
    }
    
    @IBAction func memoryModeSelected(_ sender: Any) {
        memoryMode = true
    }
}
