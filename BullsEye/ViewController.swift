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
    
    // UI references
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblTarget: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    }
    
    @IBAction func showAlert() {
        // caculate the difference of the current silder value and the target value useing abs "absolute Value"
        let difference = abs(currentValue - targetValue)
        
        // setting up and showing alert when hit me is pressed
        let message = "The value of the slider is: \(currentValue)" +
                        "\nThe target value is: \(targetValue)" +
                        "\nThe difference is: \(difference)"
        let alert = UIAlertController(title: "Current Value", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        // update current value with the sliders value rounded to the nearest whole number
        currentValue = lroundf(slider.value)
    }

}


