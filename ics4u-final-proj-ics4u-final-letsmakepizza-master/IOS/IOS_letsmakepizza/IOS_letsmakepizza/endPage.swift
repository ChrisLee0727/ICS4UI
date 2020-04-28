//
//  endPage.swift
//  IOS_letsmakepizza
//
//  Created by Jiahao Zhang on 2019-06-17.
//  Copyright © 2019 ICS4UI. All rights reserved.
//

import UIKit

class endPage: UIViewController {

    @IBOutlet weak var pizzaDoneText: UILabel!
    @IBOutlet weak var pizzaBurnedText: UILabel!
    @IBOutlet weak var scores: UILabel!
    
    @IBAction func tostartagain(_ sender: UIButton) {
        restart()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if difficulty == "easy"{
            pizzasDone = 3 - pizzasBurnt
        }
        else if difficulty == "medium"{
            pizzasDone = 4 - pizzasBurnt

        }
        else if difficulty == "hard"{
            pizzasDone = 6 - pizzasBurnt
        }
        
        pizzaDoneText.text = "Pizzas Done: " + String(pizzasDone)
        pizzaBurnedText.text = "Pizzas Burned: " + String(pizzasBurnt)
        scores.text = "Score:" + String(Float(pizzasDone)/Float(pizzasDone+pizzasBurnt))
    }

}
