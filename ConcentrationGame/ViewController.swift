//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Timur Alimbekov on 5/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    //для того, чтобы не произошло замыкание используем lazy, т.к эта переменная будет инициализированна только тогда, когда к ней на прямую обратяться
    //
    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    
    
    
    //переменная которая следит за кол-вом нажатий кнопки
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    // массив эмодзи
    var emojiCollection = ["🦊","🐰","🦁","🙊","🐼","🦄","🐮","🐨","🐭","🐯","🐶", "🐱"]
    
    var emojiDict = [Int : String]()
    
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDict[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            
            emojiDict[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            }
        }
    }
    
    // массив кнопок
    @IBOutlet var buttonCollection: [UIButton]!
    //лейбл
    @IBOutlet weak var touchLabel: UILabel!
    // действие при нажатии кнопки
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCards(at: buttonIndex)
            updateViewFromModel()
        }
    }
}

