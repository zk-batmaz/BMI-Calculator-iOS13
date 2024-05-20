//
//  CalculaterBrain.swift
//  BMI Calculator
//
//  Created by Zeynep Kübra Batmaz on 18.05.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculaterBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let color = (underweight: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), healthy: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), overweight: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        
        let bmiValue = (weight / pow(height, 2))
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You should eat more snacks", color: color.underweight  )
        }
        else if bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle.", color: color.healthy)
        }
        else {
            bmi = BMI(value: bmiValue, advice: "You should stop eating snacks", color: color.overweight)
        }
        
    }
    
    func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiValue
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getBackgroundColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
