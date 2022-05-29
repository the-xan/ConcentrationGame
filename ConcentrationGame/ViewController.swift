//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Timur Alimbekov on 5/29/22.
//

import UIKit

class ViewController: UIViewController {

    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    let emojiCollection = ["🦊","🐰","🦊","🐰"]
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.5899501443, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }  
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
        
    }
}

