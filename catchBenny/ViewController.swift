//
//  ViewController.swift
//  catchBenny
//
//  Created by Caroline on 20/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0

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
    }

    //
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }

}

