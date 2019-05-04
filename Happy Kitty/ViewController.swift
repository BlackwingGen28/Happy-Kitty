//
//  ViewController.swift
//  Happy Kitty
//
//  Created by Jordan.Morgan2 on 4/23/19.
//  Copyright © 2019 Jordan.Morgan2. All rights reserved.
//
//  I attempted to have 2 view controllers so you could name your cat, but had connection issues.
//

import UIKit
var catName: String = "Gerbil"

struct Kitty {
    var name: String
    var kittyHappiness: Int = 50
}

class ViewControllerOne: UIViewController {

    @IBOutlet weak var catMessage: UILabel!
    
    @IBOutlet weak var happyKitty: UIImageView!
    @IBOutlet weak var neutralKitty: UIImageView!
    @IBOutlet weak var angryKitty: UIImageView!
    
    var timesPlayed: Int = 0//these make it so you cannot spam a button
    //var timesSprayed: Int = 0 <--- you are allowed to spam the spray button.
    var timesFed: Int = 0
    
    var myCat = Kitty(name: catName, kittyHappiness: 50)
    
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
        if (myCat.kittyHappiness > 75) {
            happyKitty.alpha = 1
            neutralKitty.alpha = 0
            angryKitty.alpha = 0
        } else if (myCat.kittyHappiness < 25) {
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
        if (timesPlayed < 5){
            timesPlayed += 1
            timesFed -= 1
            catMessage.text = "\(myCat.name) likes this!"
            myCat.kittyHappiness += 5
            check_kitty_happiness()
        }else{//played with cat 5 or more times
            catMessage.text = "\(myCat.name) does not want to play right now."
        }
    }
    
    @IBAction func sprayButtonPressed(_ sender: Any) {
        catMessage.text = "\(myCat.name) dislikes this!"
        myCat.kittyHappiness -= 5
        check_kitty_happiness()
    }
    
    @IBAction func feedButtonPressed(_ sender: Any) {
        if (timesFed < 3){
            timesFed += 1
            timesPlayed -= 1
            catMessage.text = "\(myCat.name) really likes this!"
            myCat.kittyHappiness += 10
            check_kitty_happiness()
        } else {
            catMessage.text = "\(myCat.name) does not want to eat right now."
        }
    }
    
    
    @IBAction func checkHappButtonPressed(_ sender: Any) {
        switch myCat.kittyHappiness {
        case 0..<25:
            catMessage.text = "\(myCat.name) is Angry!"
        case 75..<1000:
            catMessage.text = "\(myCat.name) is Happy!"
        default:
            catMessage.text = "\(myCat.name) is Calm."
        }
    }
}



