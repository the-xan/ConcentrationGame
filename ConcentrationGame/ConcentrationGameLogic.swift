//
//  ConcentrationGameLogic.swift
//  ConcentrationGame
//
//  Created by Timur Alimbekov on 5/30/22.
//

import Foundation

class ConcentrationGame {
    // массив карточек ()
    var cards = [Card]()
    
    // Индекс 1 единсвенной карточки перевернутой вверх
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // Механизм выбора карточек
    func chooseCards(at index: Int) {
        //Если карточки не совпали то
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // при инициализации будет добавлять в массив cards 2 одинаковые карточки card
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
}

