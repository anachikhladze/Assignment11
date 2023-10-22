//
//  ViewController.swift
//  Assignment11
//
//  Created by Anna Sumire on 22.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var switchStateLabel: UILabel!
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var calculateButton: UIButton!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchStateLabel.text = "Calculating GCD"
        firstNumberTextField.placeholder = "Enter first number"
        secondNumberTextField.placeholder = "Enter second number"
        resultLabel.text = "Result is..."
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.layer.masksToBounds = true
    }
    
    
    //MARK: - IBActions
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        if !sender.isOn {
            switchStateLabel.text = "Calculating LCM"
        } else {
            switchStateLabel.text = "Calculating GCD"
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if mySwitch.isOn {
            calculateResultForGCD()
        } else {
            calculateResultForLCM()
        }
    }
    
    //MARK: - Methods
    func calculateGCD(_ x: Int, _ y: Int) -> Int {
        var a = 0
        var b = max(x, y)
        var r = min(x, y)
        
        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        return b
    }
    
    func calculateLCM(_ x: Int, _ y: Int) -> Int {
        x / calculateGCD(x, y) * y
    }
    
    func calculateResultForGCD() {
        if let firstInputText = firstNumberTextField.text, let firstInputNumber = Int(firstInputText),
           let secondInputText = secondNumberTextField.text, let secondInputNumber = Int(secondInputText) {
            let result = calculateGCD(firstInputNumber, secondInputNumber)
            resultLabel.text = "Result is \(result)"
        } else {
            resultLabel.text = "Invalid Input, try again."
        }
    }
    
    func calculateResultForLCM() {
        if let firstInputText = firstNumberTextField.text, let firstInputNumber = Int(firstInputText),
           let secondInputText = secondNumberTextField.text, let secondInputNumber = Int(secondInputText) {
            let result = calculateLCM(firstInputNumber, secondInputNumber)
            resultLabel.text = "Result is \(result)"
        } else {
            resultLabel.text = "Invalid Input, try again."
        }
    }
}
