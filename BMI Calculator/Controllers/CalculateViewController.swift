//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculaterBrain = CalculaterBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .down
        let currentHeight = formatter.string(from: NSNumber.init(value: sender.value))
        heightLabel.text = "\(currentHeight ?? "1.5m")m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let currentWeight = Int(sender.value)
        weightLabel.text = "\(currentWeight)Kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculaterBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculaterBrain.getBMIValue()
            destinationVC.advice = calculaterBrain.getAdvice()
            destinationVC.backgroundC = calculaterBrain.getBackgroundColor()
        }
    }
}

