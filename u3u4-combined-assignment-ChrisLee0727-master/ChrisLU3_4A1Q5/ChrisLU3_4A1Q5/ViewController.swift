//
//  ViewController.swift
//  ChrisLU3_4A1Q5
//
//  Chris Lee
//  ICS4UI
//  Ms.Harris
//
//  Created by Chris Lee on 20/05/2019.
//  Copyright © 2019 ChrisLee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    // borrowed InternetWords from https://www.smart-words.org/abbreviations/text.html with my ideas

    let InternetWords: [String: String] = ["2F4U": "Too Fast For You", "AAMOF": "As a Matter of Fact", "CU": "See you", "BTT": "Back to Topic", "BTW": "By the Way", "BC": "Because", "AB": "About", "ABT": "About", "HF": "Have Fun", "HTH": "Hope this Helps", "IDK": "I don't know", "FTW": "Fuck thw World", "IMO": "In my Opinion", "LOL": "Laughing out loud", "IOW": "In other Words", "N/A": "Not Available", "NNTR": "NO need to Reply", "NOYB": "None of your Business", "OMG": "Oh my God", "OTOH": "On the other Hand", "SFLR": "Sorry for late Reply", "TGIF": "Thanks God, its Friday", "THX": "Thank you", "LMAO": "Laughing my ass off", "ROFL": "Rolling on the floor lauging", "TQ": "Thank you", "TNX": "Thanks", "WTF": "What the fuck", "WTH": "What the Hell", "ASAP": "As Soon as Possible", "B3": "Blah Blah Blah", "QT": "Cutie", "R": "are", "U": "you", "GONNA": "going to", "UR": "Your", "TMI": "Too Much Information", "WB": "Welcome Back", "NP": "No Prhoblem", "IDC": "I don't care"]
    
    //declare and set variables
    var convert:Int = 4;

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label_language1: UILabel!
    @IBOutlet weak var label_language2: UILabel!
    @IBOutlet weak var btn_convert: UIButton!
    @IBOutlet weak var textView_output: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func textField_editingChanged(_ sender: Any) {
        var raw_text: Array<String> = []
        var text: String = ""
        raw_text = textField.text!.split(separator: " ").map(String.init) //split and change as String
        
        if (raw_text.count == 0) { //debug system for when user delete the text
            text = ""
        }else {
            for i in 0 ... (raw_text.count - 1) {

                if ((InternetWords["\(raw_text[i].uppercased())"]) != nil) { // if user inserted the word is in Dictionary,
                    raw_text[i] = InternetWords[raw_text[i].uppercased()]! // replace the Internet word to regular word

                }
                text += raw_text[i] + " " // add in text

            }
            
            textView_output.text! = text // display the text
            
        }
        
        
    }
}

