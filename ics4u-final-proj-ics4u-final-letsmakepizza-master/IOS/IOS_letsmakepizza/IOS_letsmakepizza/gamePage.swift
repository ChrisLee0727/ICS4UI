//
//  gamePage.swift
//  IOS_letsmakepizza
//
//  Created by Jiahao Zhang on 2019-06-07.
//  Copyright © 2019 ICS4UI. All rights reserved.
//

import UIKit
import AVFoundation

class gamePage:UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate {
    
    

    var first_round:Bool = true
    var AudioPlayer = AVAudioPlayer()
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var endTurnBtn: UIButton!
    @IBOutlet weak var playCardBtn: UIButton!
    @IBOutlet weak var playerText: UILabel!
    @IBOutlet weak var ovenText: UILabel!
    @IBOutlet weak var cards: UITableView!
    @IBOutlet weak var rightImage_1: UIImageView!
    @IBOutlet weak var rightImage_2: UIImageView!
    @IBOutlet weak var rightImage_3: UIImageView!
    @IBOutlet weak var leftImage_1: UIImageView!
    @IBOutlet weak var leftImage_2: UIImageView!
    @IBOutlet weak var leftImage_3: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "game_page_v1", ofType: "wav")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
        self.cards.dataSource = self
        self.cards.delegate = self
        cards.reloadData()
        cv.dataSource = self
        cv.delegate = self
        setlist()
        
        for _ in 1...number_of_players{
            deck.append([])
            
        //give image to pizza order on the top part
        //current_order can be changed any time

        current_order = orderList[0]
        print (current_order)


        
        //order(Int) represents which order currently in use
        leftImageSet(order:0)
        rightImageSet(order:0)
        
        //hide image on pizza at the beginning
        leftImage_1.isHidden = true
        leftImage_2.isHidden = true
        leftImage_3.isHidden = true
        }
        
        endTurnBtn.tintColor = UIColor.yellow
        endTurnBtn.layer.masksToBounds = true
        endTurnBtn.layer.cornerRadius = 10
        endTurnBtn.layer.borderWidth = 2
        endTurnBtn.layer.borderColor = UIColor.yellow.cgColor
        playCardBtn.tintColor = UIColor.yellow
        playCardBtn.layer.masksToBounds = true
        playCardBtn.layer.cornerRadius = 10
        playCardBtn.layer.borderWidth = 2
        playCardBtn.layer.borderColor = UIColor.yellow.cgColor
        cards.allowsSelection = false
    }
    
    func leftImageSet(order : Int){
        leftImage_1.image = string_to_UIimage(string:current_order[order])
        leftImage_2.image = string_to_UIimage(string:current_order[order+1])
        leftImage_3.image = string_to_UIimage(string:current_order[order+2])
        leftImage_1.isHidden = true
        leftImage_2.isHidden = true
        leftImage_3.isHidden = true
    }
    func rightImageSet(order : Int){
        rightImage_1.image = string_to_UIimage(string:current_order[order])
        rightImage_2.image = string_to_UIimage(string:current_order[order+1])
        rightImage_3.image = string_to_UIimage(string:current_order[order+2])
        rightImage_1.isHidden = false
        rightImage_2.isHidden = false
        rightImage_3.isHidden = false
    }
    
    func fiveOvens(){
        //let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "banger", ofType: "wav")!)
        playSound("banger", "wav")
        //AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        //AudioPlayer.prepareToPlay()
        //AudioPlayer.numberOfLoops = 0
        //AudioPlayer.play()
        just_explode = true

        for _ in 1...5 {
            cards_on_the_ground.append("oven")
        }
        if (deck.count != 0){
            for j in 0...deck.count-1 {
                if deck[j].count == 0 {
                    continue
                }
                for n in 0...deck[j].count-1 {
                    cards_on_the_ground.append(deck[j][n])
                }
                deck[j].removeAll()
            }
        }
        orderList.remove(at: 0)
        if (orderList.count != 0) {
        current_order=orderList[0]
        leftImageSet(order: 0)
        rightImageSet(order: 0)
        number_of_oven = 0
        makeListrandom()
        devideList()
        choosenCardsIndex.removeAll()
        ovenIndex.removeAll()
        cards.reloadData()
        cv.reloadData()
        ovenText.text = "Oven: " + String(number_of_oven) + "/5"
        print("场上的卡")
        print(cards_on_the_ground)
        }
        else {
            gameend()
        }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return card_list_for_table_view.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as! cardCell
        
        let rowNumber : Int = indexPath.row
        
        if(rowNumber == card_list_for_table_view.count-1 && card_list_for_table_view[card_list_for_table_view.count-1].count != 3){
            if(card_list_for_table_view[card_list_for_table_view.count-1].count == 1){
                cell.card2.isHidden = true
                cell.card3.isHidden = true
                cell.card1.ingredient = card_list_for_table_view[rowNumber][0]
            }else if (card_list_for_table_view[card_list_for_table_view.count-1].count == 2){
                cell.card3.isHidden = true
                cell.card1.ingredient = card_list_for_table_view[rowNumber][0]
                cell.card2.ingredient = card_list_for_table_view[rowNumber][1]
            }
        }else{
            cell.card1.ingredient = card_list_for_table_view[rowNumber][0]
            cell.card1.index = rowNumber*3+1
            cell.card2.ingredient = card_list_for_table_view[rowNumber][1]
            cell.card2.index = rowNumber*3+2
            cell.card3.ingredient = card_list_for_table_view[rowNumber][2]
            cell.card3.index = rowNumber*3+3
            cell.card1.addTarget(self, action: #selector(press1(_:)), for: UIControl.Event.touchUpInside)
            cell.card2.addTarget(self, action: #selector(press2(_:)), for: UIControl.Event.touchUpInside)
            cell.card3.addTarget(self, action: #selector(press3(_:)), for: UIControl.Event.touchUpInside)
        }
        if choosenCardsIndex.contains(cell.card1.index){
            cell.card1.isHidden = true
        }
        else {
            cell.card1.isHidden = false
        }
        if choosenCardsIndex.contains(cell.card2.index){
            cell.card2.isHidden = true
        }
        else {
            cell.card2.isHidden = false
        }
        if choosenCardsIndex.contains(cell.card3.index){
            cell.card3.isHidden = true
        }
        else {
            cell.card3.isHidden = false
        }
        if ovenIndex.contains(cell.card1.index){
            cell.oven1.isHidden = false
        } else {
            cell.oven1.isHidden = true
        }
        if ovenIndex.contains(cell.card2.index){
            cell.oven2.isHidden = false
        } else {
            cell.oven2.isHidden = true
        }
        if ovenIndex.contains(cell.card3.index){
            cell.oven3.isHidden = false
        } else {
            cell.oven3.isHidden = true
        }
        let margins = cell.layoutMarginsGuide
        cell.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        cell.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        return cell
    }
    
    @IBAction func pressEndTurnBtn(_ sender: Any) {
        playSound("button-click", "mp3")
        if (playStage == 2){
            playStage = 1
            if (current_round < number_of_players){
                current_round += 1
            }
            else{
                current_round = 1
                first_round = false
            }
            alreadyChooseCard = false
            playerText.text = "Player: " + String(current_round)
            cv.reloadData()
        //cv.collectionViewLayout.invalidateLayout()
        //cv.layoutSubviews()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        return deck[current_round-1].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = cv.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!  CollectionViewCell
        cell.card.ingredient = deck[current_round-1][indexPath.row]
        cell.card.addTarget(self, action: #selector(chooseCard(_:)), for: UIControl.Event.touchUpInside)
        cell.ingre_image.image = string_to_UIimage(string:deck[current_round-1][indexPath.row])
        return cell
    }
    
    @IBAction func press1(_ sender: cardButton) {
        playSound("flipping", "m4a")
        if (just_explode || just_finish_order){
            just_finish_order = false
            just_explode = false
             //let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "flipping", ofType: "m4a")!)
            playSound("flipping", "m4a")
            
            //AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
            //AudioPlayer.prepareToPlay()
            //AudioPlayer.numberOfLoops = -1
            //AudioPlayer.play()
        }
        print("场上的卡")
        print(cards_on_the_ground)
        if (alreadyChooseCard == false && playStage == 1){
            if current_order.contains(sender.ingredient){
                sender.isHidden = true
                choosenCardsIndex.append(sender.index)
                playStage = 2
                var index = 0
                index = current_order.firstIndex(of:sender.ingredient)!
                switch index{
                case 0:
                    leftImage_1.isHidden = false
                    rightImage_1.isHidden = true
                case 1:
                    leftImage_2.isHidden = false
                    rightImage_2.isHidden = true
                case 2:
                    leftImage_3.isHidden = false
                    rightImage_3.isHidden = true
                default:
                    print("没找到")
                }
                current_order[index]=""
                if checkEmpty(current_order) {
                    just_finish_order = true
                    let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pizza_done", ofType: "wav")!)
                    playSound("pizza_done", "wav")
                    AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
                    AudioPlayer.prepareToPlay()
                    AudioPlayer.numberOfLoops = 0
                    AudioPlayer.play()
                    orderList.remove(at: 0)
                    if orderList.count == 0 {
                        gameend()
                    }
                    
                    if orderList.count != 0{
                        current_order = orderList[0]
                    }
                    leftImageSet(order:0)
                    rightImageSet(order:0)
                    leftImage_1.isHidden = true
                    leftImage_2.isHidden = true
                    leftImage_3.isHidden = true
                    rightImage_1.isHidden = false
                    rightImage_2.isHidden = false
                    rightImage_3.isHidden = false
                }
            }
            else{
                playStage = 2
                press = 0
                sender.isHidden = true
                choosenCardsIndex.append(sender.index)
                current_card = sender.ingredient
                alreadyChooseCard = true
            //            card1.setImage(string_to_UIimage(string: current_card), for: .normal)
                if(current_card == "oven"){
                    let position = cards_on_the_ground.firstIndex(of: "oven")
                    cards_on_the_ground.remove(at: position!)
                    number_of_oven += 1
                    ovenText.text = "Oven: " + String(number_of_oven) + "/5"
                    ovenIndex.append(sender.index)
                    cards.reloadData()
                    if (number_of_oven == 5){
                        playSound("pizza-burnt", "mp3")
                        pizzasBurnt += 1
                        fiveOvens()
                    }
                
                }
                else {
                    print("抽到了什么卡")
                    print(sender.ingredient)
                    let position:Int? = cards_on_the_ground.firstIndex(of: sender.ingredient)
                    cards_on_the_ground.remove(at: position!)
                    deck[current_round-1].append(current_card)
                    cv.reloadData()
                }
            }
        }
        cv.reloadData()
        cards.reloadData()

    }
    @IBAction func press2(_ sender: cardButton) {
        playSound("flipping", "m4a")
        if (just_explode || just_finish_order){
            just_finish_order = false
            just_explode = false
            let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "flipping", ofType: "m4a")!)
            playSound("flipping", "m4a")
            AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
            AudioPlayer.prepareToPlay()
            AudioPlayer.numberOfLoops = -1
            AudioPlayer.play()
        }
        print("场上的卡")
        print(cards_on_the_ground)
        if (alreadyChooseCard == false && playStage == 1){
            if current_order.contains(sender.ingredient){
                sender.isHidden = true
                choosenCardsIndex.append(sender.index)
                playStage = 2
                var index = 0
                index = current_order.firstIndex(of:sender.ingredient)!
                switch index{
                case 0:
                    leftImage_1.isHidden = false
                    rightImage_1.isHidden = true
                case 1:
                    leftImage_2.isHidden = false
                    rightImage_2.isHidden = true
                case 2:
                    leftImage_3.isHidden = false
                    rightImage_3.isHidden = true
                default:
                    print("没找到")
                }
                current_order[index]=""
                if checkEmpty(current_order) {
                    just_finish_order = true
                    let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pizza_done", ofType: "wav")!)
                    playSound("pizza_done", "wav")
                    AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
                    AudioPlayer.prepareToPlay()
                    AudioPlayer.numberOfLoops = 0
                    AudioPlayer.play()
                    orderList.remove(at: 0)
                    if orderList.count == 0 {
                        gameend()
                    }
                    
                    if orderList.count != 0{
                        current_order = orderList[0]
                    }
                    leftImageSet(order:0)
                    rightImageSet(order:0)
                    leftImage_1.isHidden = true
                    leftImage_2.isHidden = true
                    leftImage_3.isHidden = true
                    rightImage_1.isHidden = false
                    rightImage_2.isHidden = false
                    rightImage_3.isHidden = false
                }
            }
            else{
                playStage = 2
                press = 1
                sender.isHidden = true
                choosenCardsIndex.append(sender.index)
                current_card = sender.ingredient
                alreadyChooseCard = true
                if(current_card == "oven"){
                    number_of_oven += 1
                    let position = cards_on_the_ground.firstIndex(of: "oven")
                    cards_on_the_ground.remove(at: position!)
                    ovenText.text = "Oven: " + String(number_of_oven) + "/5"
                    ovenIndex.append(sender.index)
                    cards.reloadData()
                    if (number_of_oven == 5){
                        pizzasBurnt += 1
                        fiveOvens()
                    }
                }
                else{
                    print("抽到了什么卡")
                    print(sender.ingredient)
                    let position = cards_on_the_ground.firstIndex(of: sender.ingredient)
                    cards_on_the_ground.remove(at: position!)
                    deck[current_round-1].append(current_card)
                    cv.reloadData()
                }
            }
        }
        cv.reloadData()
        cards.reloadData()

    }
    @IBAction func press3(_ sender: cardButton) {
        playSound("flipping", "m4a")
        if (just_explode || just_finish_order){
            just_finish_order = false
            just_explode = false
            let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "flipping", ofType: "m4a")!)
            playSound("flipping", "m4a")
            AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
            AudioPlayer.prepareToPlay()
            AudioPlayer.numberOfLoops = -1
            AudioPlayer.play()
        }
        print("场上的卡")
        print(cards_on_the_ground)
        if (alreadyChooseCard == false && playStage == 1){
            if current_order.contains(sender.ingredient){
                sender.isHidden = true
                choosenCardsIndex.append(sender.index)
                playStage = 2
                var index = 0
                index = current_order.firstIndex(of:sender.ingredient)!
                switch index{
                case 0:
                    leftImage_1.isHidden = false
                    rightImage_1.isHidden = true
                case 1:
                    leftImage_2.isHidden = false
                    rightImage_2.isHidden = true
                case 2:
                    leftImage_3.isHidden = false
                    rightImage_3.isHidden = true
                default:
                    print("没找到")
                }
                current_order[index]=""
                if checkEmpty(current_order) {
                    just_finish_order = true
                    let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pizza_done", ofType: "wav")!)
                    playSound("pizza_done", "wav")
                    AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
                    AudioPlayer.prepareToPlay()
                    AudioPlayer.numberOfLoops = 0
                    AudioPlayer.play()
                    orderList.remove(at: 0)
                    if orderList.count == 0 {
                        gameend()
                    }
                    
                    if orderList.count != 0{
                        current_order = orderList[0]
                    }
                    leftImageSet(order:0)
                    rightImageSet(order:0)
                    leftImage_1.isHidden = true
                    leftImage_2.isHidden = true
                    leftImage_3.isHidden = true
                    rightImage_1.isHidden = false
                    rightImage_2.isHidden = false
                    rightImage_3.isHidden = false
                }
            }
            else{
                playStage = 2
                press = 2
                sender.isHidden = true
                choosenCardsIndex.append(sender.index)
                current_card = sender.ingredient
                alreadyChooseCard = true
                if(current_card == "oven"){
                    number_of_oven += 1
                    print("炉子数量")
                    print(number_of_oven)
                    let position = cards_on_the_ground.firstIndex(of: "oven")
                    cards_on_the_ground.remove(at: position!)
                    ovenText.text = "Oven: " + String(number_of_oven) + "/5"
                    ovenIndex.append(sender.index)
                    cards.reloadData()
                    if (number_of_oven == 5){
                        pizzasBurnt += 1
                        fiveOvens()
                    }
                }
                else{
                    print("抽到了什么卡")
                    print(sender.ingredient)
                    let position = cards_on_the_ground.firstIndex(of: sender.ingredient)
                    cards_on_the_ground.remove(at: position!)
                    deck[current_round-1].append(current_card)
                    cv.reloadData()
                }
            }
        }
        cv.reloadData()
        cards.reloadData()
    }
    @IBAction func pressPlayCardBtn(_ sender: Any) {
        playSound("button-clcik", "mp3")
        playStage = 2
        playCardBtn.isHidden = true
        var index = 0
        index = deck[current_round-1].firstIndex(of: choosenCard)!
        deck[current_round-1].remove(at: index)
        cv.reloadData()
        index = current_order.firstIndex(of:choosenCard)!
        switch index{
        case 0:
            leftImage_1.isHidden = false
            rightImage_1.isHidden = true
        case 1:
            leftImage_2.isHidden = false
            rightImage_2.isHidden = true
        case 2:
            leftImage_3.isHidden = false
            rightImage_3.isHidden = true
        default:
            print("没找到")
        }
        current_order[index]=""
        if checkEmpty(current_order) {
            just_finish_order = true
            let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pizza_done", ofType: "wav")!)
            playSound("pizza_done", "wav")
            AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
            AudioPlayer.prepareToPlay()
            AudioPlayer.numberOfLoops = 0
            AudioPlayer.play()
            orderList.remove(at: 0)
            if orderList.count == 0 {
                gameend()
            }
            
            if orderList.count != 0{
                current_order = orderList[0]
            }
            leftImageSet(order:0)
            rightImageSet(order:0)
            leftImage_1.isHidden = true
            leftImage_2.isHidden = true
            leftImage_3.isHidden = true
            rightImage_1.isHidden = false
            rightImage_2.isHidden = false
            rightImage_3.isHidden = false
        }
        print ("current order")
        print (current_order)
    }
    @IBAction func chooseCard(_ sender:cardButton){
        playSound("flipping", "m4a")
        choosenCard = sender.ingredient
        print("选中的牌")
        print(choosenCard)
        print ("current order")
        print (current_order)
        if playStage == 1{
            if current_order.contains(sender.ingredient) {
                playCardBtn.isHidden = false
                
            }
            else{
                playCardBtn.isHidden = true
            }
        }
    }
    func gameend(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "endPage") as! endPage
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func checkEmpty(_ list:[String]) -> Bool {
        var empty = true
        for i in list {
            if i != ""{
                empty = false
            }
        }
        return empty
    }
   
    
}

