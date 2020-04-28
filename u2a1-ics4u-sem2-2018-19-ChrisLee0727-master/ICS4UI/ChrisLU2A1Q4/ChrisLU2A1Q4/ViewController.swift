//
//  ViewController.swift
//  ChrisLU2A1Q4
//
//  Created by Chris Lee on 10/04/2019.
//  Copyright © 2019 ChrisLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //set variables
    @IBOutlet weak var AI_mask: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var AI_play: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    let loseFace = ["☹️", "😩", "🤬", "😱", "😧"]
    let winFace = ["😝", "😜", "😆"]
    let tieFace = ["😒", "🤨", "🧐"]
    
    let winText = ["HaHa I win", "So easy dude", "Eeasy peasy"]
    let loseText = ["Ahrrr, maybe not for next time!", "OMG I lose", "GG You are good"]
    let tieText = ["Okay Okay It's tie", "So close, it's tie", "Um.. let's play one more time", "Actually I just gave you a chance"]
    
    let rock = "✊"
    let paper = "🖐"
    let scissor = "✌️"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func rockClicked(_ sender: Any) { // if player choose rock
        let aiPlay = arc4random_uniform(3) + 1 // 1: rock 2: scissor 3: paper
        
        if aiPlay == 1 { //tie
            AI_mask.text = tieFace.randomElement()
            AI_play.text = rock
            statusLabel.text = tieText.randomElement()
        }
        else if aiPlay == 2 { //player(rock) win & AI(scissor) lose
            AI_mask.text = loseFace.randomElement()
            AI_play.text = scissor
            statusLabel.text = loseText.randomElement()
        }
        else if aiPlay == 3 { //player(rock) lose & AI(paper) win
            AI_mask.text = winFace.randomElement()
            AI_play.text = paper
            statusLabel.text = winText.randomElement()
        }
        
    }
    
    @IBAction func scissorClicked(_ sender: Any) { //if player choose scissor
        let aiPlay = arc4random_uniform(3) + 1 // 1: rock 2: scissor 3: paper
        
        if aiPlay == 1 { //player(scissor) lose & AI(rock) win
            AI_mask.text = winFace.randomElement()
            AI_play.text = rock
            statusLabel.text = winText.randomElement()
        }
        else if aiPlay == 2 { //tie
            AI_mask.text = tieFace.randomElement()
            AI_play.text = scissor
            statusLabel.text = tieText.randomElement()
        }
        else if aiPlay == 3 { //player(scissor) win & AI(paper) lose
            AI_mask.text = loseFace.randomElement()
            AI_play.text = paper
            statusLabel.text = loseText.randomElement()
        }
    }
    
    @IBAction func paperClicked(_ sender: Any) { //if player chose paper
        let aiPlay = arc4random_uniform(3) + 1 // 1: rock 2: scissor 3: paper
        
        if aiPlay == 1 { //player(paper) win & AI(rock) lose
            AI_mask.text = loseFace.randomElement()
            AI_play.text = rock
            statusLabel.text = loseText.randomElement()
        }
        else if aiPlay == 2 { //player(paper) lose & AI(scissor) win
            AI_mask.text = winFace.randomElement()
            AI_play.text = scissor
            statusLabel.text = winText.randomElement()
        }
        else if aiPlay == 3 { //tie
            AI_mask.text = tieFace.randomElement()
            AI_play.text = paper
            statusLabel.text = tieText.randomElement()
        }
    }
    
}

