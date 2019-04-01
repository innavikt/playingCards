//
//  ViewController.swift
//  playingCrads
//
//  Created by inna on 20/03/2019.
//  Copyright © 2019 inna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }


}

