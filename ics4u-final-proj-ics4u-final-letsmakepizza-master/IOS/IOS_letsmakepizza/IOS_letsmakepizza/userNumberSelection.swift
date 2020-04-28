//
//  userNumberSelection.swift
//  IOS_letsmakepizza
//
//  Created by Jiahao Zhang on 2019-05-29.
//  Copyright © 2019 ICS4UI. All rights reserved.
//

import UIKit


class userNumberSelection: UIViewController {

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var userNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.maximumValue = 6
        slider.minimumValue = 2
        userNumberLabel.text = "2"
        slider.value = 2
        StartButton.tintColor = UIColor.yellow
        StartButton.layer.masksToBounds = true
        StartButton.layer.cornerRadius = 10
        StartButton.layer.borderWidth = 2
        StartButton.layer.borderColor = UIColor.yellow.cgColor

        // Do any additional setup after loading the view.
    }

    @IBAction func userNumberChanged(_ sender: UISlider) {
        number_of_players = Int(slider.value)
        userNumberLabel.text = "\(number_of_players)"
    }
    @IBAction func startBtnClicked(_ sender: Any) {
        number_of_players = Int(slider.value)
        print("number of player: " + String(number_of_players))
        playSound("button-click", "mp3")

    }
    
}
