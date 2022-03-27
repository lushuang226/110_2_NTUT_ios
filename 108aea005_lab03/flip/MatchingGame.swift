//
//  MatchingGame.swift
//  flip
//
//  Created by LINN on 2021/3/17.
//

import Foundation

class MatchingGame{
    var cards = [Card]()
    
    func chooseCard(at index:Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }
    }
   
    init(numberOfPairsOfCards:Int)
    {
        var temp=0
        temp = numberOfPairsOfCards - 1
        for _ in 0...temp{
        let card = Card()
        cards.append(card)
        }
    }
}

