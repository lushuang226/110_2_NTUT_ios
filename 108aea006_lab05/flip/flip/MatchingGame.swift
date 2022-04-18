//
//  MatchingGame.swift
//  flip
//
//  Created by LINN on 2021/3/17.
//

import Foundation

class MatchingGame{
    var cards = [Card]()
    var score:Int = 0
    func chooseCard(at index: Int){
        score-=1
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score+=6
                }
                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
            }
                else {
                    indexOfOneAndOnlyFaceUpCard = index
                    }
                }
            }
//            }
//            else { //no cards face up or 2 cards are face up
//                for flipDownIndex in cards.indices{
//                    cards[flipDownIndex].isFaceUp = false
//                } // all cards set back to face down
//                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = index
//            }
//        }
//    }
        
       
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
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
    
    func getScore()->Int{
        return score
    }
}

