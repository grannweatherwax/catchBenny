//
//  ViewController.swift
//  catchBenny
//
//  Created by Caroline on 20/03/2023.
//

import UIKit

class ViewController: UIViewController {
    // variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var beniArray = [UIImageView]()
    var hideTimer = Timer()

    // views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var beni1: UIImageView!
    @IBOutlet weak var beni2: UIImageView!
    @IBOutlet weak var beni3: UIImageView!
    @IBOutlet weak var beni4: UIImageView!
    @IBOutlet weak var beni5: UIImageView!
    @IBOutlet weak var beni6: UIImageView!
    @IBOutlet weak var beni7: UIImageView!
    @IBOutlet weak var beni8: UIImageView!
    @IBOutlet weak var beni9: UIImageView!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial score
        scoreLabel.text = "Score: \(score)"
        
        // enable interaction on beni images
        beni1.isUserInteractionEnabled = true
        beni2.isUserInteractionEnabled = true
        beni3.isUserInteractionEnabled = true
        beni4.isUserInteractionEnabled = true
        beni5.isUserInteractionEnabled = true
        beni6.isUserInteractionEnabled = true
        beni7.isUserInteractionEnabled = true
        beni8.isUserInteractionEnabled = true
        beni9.isUserInteractionEnabled = true
        
        // create recognizers for the benis
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        // attach the benis to their recognizers
        beni1.addGestureRecognizer(recognizer1)
        beni2.addGestureRecognizer(recognizer2)
        beni3.addGestureRecognizer(recognizer3)
        beni4.addGestureRecognizer(recognizer4)
        beni5.addGestureRecognizer(recognizer5)
        beni6.addGestureRecognizer(recognizer6)
        beni7.addGestureRecognizer(recognizer7)
        beni8.addGestureRecognizer(recognizer8)
        beni9.addGestureRecognizer(recognizer9)
        
        beniArray = [beni1, beni2, beni3, beni4, beni5, beni6, beni7, beni8, beni9]
        
        hideBeni()
        
        // timers
        counter = 10
        timeLabel.text = String(counter)
        // set the game round timer parameters
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        // set the image hide timer parameters
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideBeni), userInfo: nil, repeats: true)
    }

    // handle incrementing and displaying score
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    // handle behavior during game round countdown
    @objc func countdown() {
        // increment counter var down
        counter -= 1
        // set timeLabel value to counter value
        timeLabel.text = String(counter)
        // behavior when counter has reached 0
        if counter == 0 {
            // remove game round timer
            timer.invalidate()
            // remove image hiding timer
            hideTimer.invalidate()
            
            // hide all Benis
            for beni in beniArray{
                beni.isHidden = true
            }
            
            // create alert setup
            let alert = UIAlertController(title: "Time's UP", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            // create ok button to end game
            let okButton = UIAlertAction(title: "Nope", style: UIAlertAction.Style.cancel, handler: nil)
            // create replay button and its functionality
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                // reset round score to 0
                self.score = 0
                // set score label text to score value
                self.scoreLabel.text = "Score: \(self.score)"
                // set countdown timer counter to 10
                self.counter = 10
                // set countdown label to counter value
                self.timeLabel.text = String(self.counter)
                // create game round timer again
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                // create image displayer timer again
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.hideBeni), userInfo: nil, repeats: true)
            }
            // add the ok button to the alert
            alert.addAction(okButton)
            // add the replay button to the alert
            alert.addAction(replayButton)
            // set the formatted alert to show itself
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // handle hiding Beni and then showing one at a time randomly
    @objc func hideBeni() {
        // hide all Beni images
        for beni in beniArray {
            beni.isHidden = true
        }
        // choose a random Beni
       let random = Int(arc4random_uniform(UInt32(beniArray.count - 1)))
        // show the random Beni
       beniArray[random].isHidden = false
    }
}

