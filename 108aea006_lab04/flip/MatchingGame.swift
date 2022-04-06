//
//  MatchingGame.swift
//  flip
//
//  Created by LINN on 2021/3/17.
//

import Foundation

class MatchingGame{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
//    func chooseCard(at index:Int){
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        }else{
//            cards[index].isFaceUp = true
//        }
//    }
   
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else { //no cards face up or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                } // all cards set back to face down
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
        
       
    init(numberOfPairsOfCards: Int)
    {
    for _ in 1...numberOfPairsOfCards
        {
    let card = Card()
    cards += [card, card]
        }
        cards = random(array:cards)
    }
    
    func random(array:[Card])->[Card]{
        var data:[Card] = array
        for i in 1..<array.count{
            let index:Int = Int(arc4random())%i
            if index != i{
                data.swapAt(i,index)
            }
        }
        return data
    }
}

