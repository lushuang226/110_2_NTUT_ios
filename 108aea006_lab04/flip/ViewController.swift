//
//  ViewController.swift
//  flip
//
//  Created by LINN on 2021/3/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cardButtons: [UIButton]!
   
    var flipCount:Int = 0{
        didSet{
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }
    
    var emojiDict:Dictionary<Int,String> = Dictionary<Int,String>()
    var emojis = ["😅","😂","🍏","🍌","🥕","🌶","🥥","🍓"]
    var flat = 0
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    func emoji(for card:Card) -> String{
        //return emojis[card.identifier-1]
        if emojiDict[card.identifier] == nil, emojis.count>0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emojiDict[card.identifier] = emojis.remove(at: randomIndex)
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
    lazy var game:MatchingGame = MatchingGame(numberOfPairsOfCards:(cardButtons.count+1)/2)
    
    
    func updateViewFromModel(){
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card),for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("",for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                if(card.isMatched){
                    button.alpha=0.5
                }
            }
        }
    }
    
    func flipViewFromModel(){
        flipCount = 0
        flipCountLabel.text! = "Flips:\(flipCount)"
        if flat == 0
        {
            for index in game.cards.indices{
                game.cards[index].isFaceUp = true
            }
            updateViewFromModel()
            flat = 1
       }else
        {
            for index in game.cards.indices{
                game.cards[index].isFaceUp = false
            }
            updateViewFromModel()
            flat = 0
        }
    }


    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of:sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            
        }
        flipCount += 1
    }

    @IBAction func reset(_ sender: UIButton) {
       game=MatchingGame(numberOfPairsOfCards:(cardButtons.count+1)/2)
        updateViewFromModel()
        
        for i in cardButtons.indices{
            cardButtons[i].alpha = 1
        }
        emojis = ["😅","😂","🍏","🍌","🥕","🌶","🥥","🍓"]
        flipCount = 0
    }
    
    @IBAction func Filp(_ sender: UIButton)
    {
        flipViewFromModel()
    }
}
