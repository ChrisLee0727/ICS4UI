//
//  globalVariables.swift
//  IOS_letsmakepizza
//
//  Created by Yaowei Yin on 2019-06-07.
//  Copyright © 2019 ICS4UI. All rights reserved.
//
import UIKit
import AVFoundation
import Foundation
var choosenCard = ""
var alreadyChooseCard = false
var memoryMode = false
var difficulty = String()
var number_of_players  = Int()
var deck :[[String]] = []
var current_round  = 1
var number_of_oven = 0
var press:Int = 0
var current_card = ""
var choosenCardsIndex:[Int] = []
var just_explode = false
var just_finish_order = false
var choosed_card:String = ""
var order_number:Int = 0
var music_player: AVAudioPlayer?



var ovenIndex:[Int] = []

let easyIngredients = ["cheese","cheese","pepperoni","pepperoni","blackOlive","blackOlive","tomato","onion","pineapple","redPepper","mushroom","oven","oven","oven","oven","oven"]
let mediumIngredients = ["cheese","cheese","cheese","pepperoni","pepperoni","blackOlive","blackOlive","tomato","tomato","onion","pineapple","redPepper","mushroom","mushroom","bacon","cucumber","oven","oven","oven","oven","oven"]
let hardIngredients = ["cheese","cheese","cheese","cheese","pepperoni","pepperoni","blackOlive","blackOlive","tomato","tomato","tomato","onion","pineapple","pineapple","redPepper","mushroom","mushroom","bacon","bacon","cucumber","ham","ham","greenOlive","greenOlive","greenPepper","oven","oven","oven","oven","oven"]

var pizzasDone = 0
var pizzasBurnt = 0

var ingredients_on_pizza = 0
//game stage
var playStage = 1

//check if the user makes any move
var drawCard = false
var playCard = false

var current_order : [String] = []

let orders = [["tomato","cheese","pineapple"],["pepperoni","redPepper","onion"],["mushroom","cheese","blackOlive"],["cucumber","mushroom","bacon"],["bacon","cheese","greenPepper"],["ham","tomato","greenOlive"]]
var orderList:[[String]] = []
func setlist() {
    if difficulty == "easy" {
        orderList.append(orders[0])
        orderList.append(orders[1])
        orderList.append(orders[2])
        
    }else if difficulty == "medium"{
        orderList.append(orders[0])
        orderList.append(orders[1])
        orderList.append(orders[2])
        orderList.append(orders[3])
        
        
    }else {
        orderList = orders
    }
    
}
var cards_on_the_ground :[String] = []
var card_list_for_table_view :[[String]] = []

func devideList (){
    var array: [[String]] = []
    var last_array: [String] = []
    var sub_ground:[String] = []
    while (cards_on_the_ground.count/3 > 0){
        array.append([cards_on_the_ground[0] , cards_on_the_ground[1] , cards_on_the_ground[2]])
        sub_ground.append(cards_on_the_ground[0])
        sub_ground.append(cards_on_the_ground[1])
        sub_ground.append(cards_on_the_ground[2])
        cards_on_the_ground.remove(at: 0)
        cards_on_the_ground.remove(at: 0)
        cards_on_the_ground.remove(at: 0)
    }
    if cards_on_the_ground.count != 0{
        for i in 0...cards_on_the_ground.count-1{
            last_array.append(cards_on_the_ground[i])
            sub_ground.append(cards_on_the_ground[i])
        }
    }
    array.append(last_array)
    cards_on_the_ground = sub_ground
    card_list_for_table_view = array
}
func makeListrandom (){
    var randomNum : Int
    var check_array : [Bool] = []
    var array :[String] = []
    let maxNum = cards_on_the_ground.count
    for _ in 0...maxNum-1{
        check_array.append(false)
    }
    for _ in 0...maxNum-1{
        randomNum = Int.random(in: 0..<maxNum)
        while (check_array[randomNum] != false){
            randomNum = Int.random(in: 0..<maxNum)
        }
        check_array[randomNum] = true
        array.append(cards_on_the_ground[randomNum])
    }
    cards_on_the_ground = array
}
func string_to_UIimage (string:String) -> UIImage{
    var image :UIImage = UIImage(named: "cheese")!
    switch string{
    case "cheese":
        image = UIImage(named: "cheese_s")!
    case "pepperoni":
        image = UIImage(named: "pepperoni_s")!
    case "blackOlive":
        image = UIImage(named: "black_olives_s")!
    case "tomato":
        image = UIImage(named: "tomatoes_s")!
    case "onion":
        image = UIImage(named: "onions_s")!
    case "pineapple":
        image = UIImage(named: "pineapples_s")!
    case "redPepper":
        image = UIImage(named: "red_peppers_s")!
    case "mushroom":
        image = UIImage(named: "mushrooms_s")!
    case "bacon":
        image = UIImage(named: "bacon_s")!
    case "cucumber":
        image = UIImage(named: "cucumbers_s")!
    case "ham":
        image = UIImage(named: "ham_s")!
    case "greenOlive":
        image = UIImage(named: "green_olives_s")!
    case "greenPepper":
        image = UIImage(named: "green_peppers_s")!
    case "oven":
        image = UIImage(named: "oven-1")!
    default:
        print("image name wrong")
    }
    return image
}
func restart(){
    choosenCard = ""
    alreadyChooseCard = false
    memoryMode = false
    difficulty = String()
    number_of_players  = Int()
    deck = []
    current_round  = 1
    number_of_oven = 0
    press = 0
    current_card = ""
    choosenCardsIndex = []
    
    choosed_card  = ""
    order_number  = 0
    cards_on_the_ground = []
    card_list_for_table_view = []
    pizzasDone = 0
    pizzasBurnt = 0
    playStage = 1
    ingredients_on_pizza = 0
    drawCard = false
    playCard = false
    
    
    ovenIndex = []
    
}

func playSound(_ soundFile:String, _ ext:String) {
    guard let url = Bundle.main.url(forResource: soundFile, withExtension: ext) else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        
        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        if ext == "wav" {
            music_player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        } else if ext == "mp3" {
            music_player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        } else if ext == "m4a" {
            music_player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
        }
        
        /* iOS 10 and earlier require the following line:
         player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        
        guard let player = music_player else { return }
        
        player.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}
