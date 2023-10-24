//
//  ViewController.swift
//  Assignment11
//
//  Created by Anna Sumire on 22.10.23.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var switchStateLabel: UILabel!
    @IBOutlet private weak var firstNumberTextField: UITextField!
    @IBOutlet private weak var secondNumberTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var mySwitch: UISwitch!
    @IBOutlet private weak var calculateButton: UIButton!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - IBActions
    @IBAction private func switchStateChanged(_ sender: UISwitch) {
        if !sender.isOn {
            switchStateLabel.text = "Calculating LCM"
        } else {
            switchStateLabel.text = "Calculating GCD"
        }
    }
    
    @IBAction private func calculateButtonPressed(_ sender: UIButton) {
        mySwitch.isOn ? calculateResultForGCD() : calculateResultForLCM()
    }
    
    //MARK: - Methods
    private func setup() {
        switchStateLabel.text = "Calculating GCD"
        firstNumberTextField.placeholder = "Enter first number"
        secondNumberTextField.placeholder = "Enter second number"
        resultLabel.text = "Result is..."
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.layer.masksToBounds = true
    }
    
    private func calculateGCD(_ x: Int, _ y: Int) -> Int {
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
    
    private func calculateLCM(_ x: Int, _ y: Int) -> Int {
        x / calculateGCD(x, y) * y
    }
    
    private func calculateResultForGCD() {
        calculateResult(using: calculateGCD)
    }
    
    private func calculateResultForLCM() {
        calculateResult(using: calculateLCM)
    }
    
    private func calculateResult(using calculationMethod: (Int, Int) -> Int) {
        if let firstInputText = firstNumberTextField.text, let firstInputNumber = Int(firstInputText),
           let secondInputText = secondNumberTextField.text, let secondInputNumber = Int(secondInputText) {
            let result = calculationMethod(firstInputNumber, secondInputNumber)
            resultLabel.text = "Result is \(result)"
        } else {
            resultLabel.text = "Invalid Input, try again."
        }
    }
}
