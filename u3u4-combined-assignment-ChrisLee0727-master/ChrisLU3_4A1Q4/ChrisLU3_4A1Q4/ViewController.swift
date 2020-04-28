//
//  ViewController.swift
//  ChrisLU3_4A1Q4
//  CHRIS LEE
//  ICS4UI
//  MS. HARRIS
//  Created by Chris Lee on 12/05/2019.
//  Copyright © 2019 ChrisLee. All rights reserved.
//

import UIKit //import UIKit

class ViewController: UIViewController {

    //declare objects
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var box1: UIView!
    @IBOutlet weak var box2: UIView!
    @IBOutlet weak var box3: UIView!
    @IBOutlet weak var box4: UIView!
    @IBOutlet weak var box5: UIView!
    @IBOutlet weak var box6: UIView!
    @IBOutlet weak var box7: UIView!
    @IBOutlet weak var box8: UIView!
    @IBOutlet weak var box9: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func upBtn(_ sender: Any) { //when btn_up clicked
        status.text = "UP"
        box1.backgroundColor = .white //reset
        box3.backgroundColor = .white
        box2.backgroundColor = .white
        box4.backgroundColor = .white
        box5.backgroundColor = .white
        box6.backgroundColor = .white
        box7.backgroundColor = .white
        box8.backgroundColor = .white
        box9.backgroundColor = .white
        
        box1.backgroundColor = .black //show
        box2.backgroundColor = .black
        box5.backgroundColor = .black
        box6.backgroundColor = .black
        box7.backgroundColor = .black
        box8.backgroundColor = .black
    }
    @IBAction func leftBtn(_ sender: Any) { // when btn_left clicked
        status.text = "LEFT"
        box1.backgroundColor = .white //reset
        box3.backgroundColor = .white
        box2.backgroundColor = .white
        box4.backgroundColor = .white
        box5.backgroundColor = .white
        box6.backgroundColor = .white
        box7.backgroundColor = .white
        box8.backgroundColor = .white
        box9.backgroundColor = .white
        
        box2.backgroundColor = .black //show
        box4.backgroundColor = .black
        box5.backgroundColor = .black
        box6.backgroundColor = .black
        box7.backgroundColor = .black
        box8.backgroundColor = .black
        box9.backgroundColor = .black
    }
    @IBAction func downBtn(_ sender: Any) { // when downBtn pressed
        status.text = "FRONT"
        box1.backgroundColor = .white //reset
        box3.backgroundColor = .white
        box2.backgroundColor = .white
        box4.backgroundColor = .white
        box5.backgroundColor = .white
        box6.backgroundColor = .white
        box7.backgroundColor = .white
        box8.backgroundColor = .white
        box9.backgroundColor = .white
        
        box2.backgroundColor = .black //show
        box4.backgroundColor = .black
        box5.backgroundColor = .black
        box6.backgroundColor = .black
        box7.backgroundColor = .black
        box8.backgroundColor = .black
        box9.backgroundColor = .black

    }
    @IBAction func rightBtn(_ sender: Any) { // when rightBtn pressed
        status.text = "RIGHT"
        box1.backgroundColor = .white //reset
        box3.backgroundColor = .white
        box2.backgroundColor = .white
        box4.backgroundColor = .white
        box5.backgroundColor = .white
        box6.backgroundColor = .white
        box7.backgroundColor = .white
        box8.backgroundColor = .white
        box9.backgroundColor = .white
        
        box2.backgroundColor = .black //show
        box4.backgroundColor = .black
        box5.backgroundColor = .black
        box6.backgroundColor = .black
        box7.backgroundColor = .black
        box8.backgroundColor = .black
        box9.backgroundColor = .black

    }
    
    @IBAction func textEdit(_ sender: Any) { // when button clicked
        if (textField.text == "11" || textField.text == "12" || textField.text == "13") { // if answer is correct
            box1.backgroundColor = .white // reset
            box3.backgroundColor = .white
            box2.backgroundColor = .white
            box4.backgroundColor = .white
            box5.backgroundColor = .white
            box6.backgroundColor = .white
            box7.backgroundColor = .white
            box8.backgroundColor = .white
            box9.backgroundColor = .white
            
            box1.backgroundColor = .red // show O
            box2.backgroundColor = .red
            box3.backgroundColor = .red
            box4.backgroundColor = .red
            box6.backgroundColor = .red
            box7.backgroundColor = .red
            box8.backgroundColor = .red
            box9.backgroundColor = .red
            
            
        } else { // wrong
            box1.backgroundColor = .white //reset
            box3.backgroundColor = .white
            box2.backgroundColor = .white
            box4.backgroundColor = .white
            box5.backgroundColor = .white
            box6.backgroundColor = .white
            box7.backgroundColor = .white
            box8.backgroundColor = .white
            box9.backgroundColor = .white
            
            box1.backgroundColor = .red //show X
            box3.backgroundColor = .red
            box5.backgroundColor = .red
            box7.backgroundColor = .red
            box9.backgroundColor = .red
            
            
        }
    }
    

}

