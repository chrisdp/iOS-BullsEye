//
//  ViewController.swift
//  BullsEye
//
//  Created by christopher dwyer-perkins on 2016-02-03.
//  Copyright © 2016 christopher dwyer-perkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
         let message = "The value of the slider is: \(currentValue)"
        // setting up and showing alert when hit me is pressed
        let alert = UIAlertController(title: "Current Value", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

}


