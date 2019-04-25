//
//  ViewController.swift
//  Happy Kitty
//
//  Created by Jordan.Morgan2 on 4/23/19.
//  Copyright © 2019 Jordan.Morgan2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var happyKitty: UIImageView!
    @IBOutlet weak var neutralKitty: UIImageView!
    @IBOutlet weak var angryKitty: UIImageView!
    
    var kittyHappiness: Int = 50;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialize_kitty()
    }

    func initialize_kitty () {
        happyKitty.alpha = 0
        neutralKitty.alpha = 1
        angryKitty.alpha = 0
    }
    
    func check_kitty_happiness () {
        if (kittyHappiness > 75) {
            happyKitty.alpha = 1
            neutralKitty.alpha = 0
            angryKitty.alpha = 0
        } else if (kittyHappiness < 25) {
            happyKitty.alpha = 0
            neutralKitty.alpha = 0
            angryKitty.alpha = 1
        } else {
            happyKitty.alpha = 0
            neutralKitty.alpha = 1
            angryKitty.alpha = 0
        }
        
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        kittyHappiness += 5
        check_kitty_happiness()
    }
    
    @IBAction func sprayButtonPressed(_ sender: Any) {
        kittyHappiness -= 5
        check_kitty_happiness()
    }
    
    @IBAction func feedButtonPressed(_ sender: Any) {
        kittyHappiness += 10
        check_kitty_happiness()
    }
}

