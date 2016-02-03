//
//  ViewController.swift
//  BullsEye
//
//  Created by christopher dwyer-perkins on 2016-02-03.
//  Copyright © 2016 christopher dwyer-perkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // game vars
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    // UI references
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblTarget: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblRound: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        // generate new target
        targetValue = 1 + Int( arc4random_uniform(100))
        // reset the sliders position
        currentValue = 1 + Int( arc4random_uniform(100))
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        lblTarget.text = String(targetValue)
        lblScore.text = String(score)
        lblRound.text = String(round)
    }
    
    @IBAction func showAlert() {
        // caculate the difference of the current silder value and the target value useing abs "absolute Value"
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        var title: String
        
        print(difference)
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        round++
        
        // setting up and showing alert when hit me is pressed
        let message = "You scored \(points) points"
            
            /*+
                        "The value of the slider is: \(currentValue)" +
                        "\nThe target value is: \(targetValue)" +
                        "\nThe difference is: \(difference)" */
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: { action in
                self.startNewRound()
                self.updateLabels()
            })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        // update current value with the sliders value rounded to the nearest whole number
        currentValue = lroundf(slider.value)
    }

}


