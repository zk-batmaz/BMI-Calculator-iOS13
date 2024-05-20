//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Zeynep Kübra Batmaz on 18.05.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabek: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    var bmiValue: String?
    var advice: String?
    var backgroundC: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabek.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = backgroundC
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
