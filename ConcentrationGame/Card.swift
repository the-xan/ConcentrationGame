//
//  Card.swift
//  ConcentrationGame
//
//  Created by Timur Alimbekov on 5/30/22.
//

import Foundation

struct Card {
    // карточка лицом вверх? (По умолчанию нет)
    var isFaceUp = false
    // совпала ли карточка?
    var isMatched = false
    //Идентификатор карточки
    var identifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}

