//
//  ViewController.swift
//  IOS_letsmakepizza
//
//  Created by Chris Lee on 22/05/2019.
//  Copyright © 2019 ICS4UI. All rights reserved.
//
//  we are using IOS branch

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    
    @IBAction func startbutton(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startBtn.layer.borderColor = UIColor.yellow.cgColor
        startBtn.layer.borderWidth = 4
//        startBtn.layer.borderColor = UIColor.
        
        // Do any additional setup after loading the view.
    }


}

