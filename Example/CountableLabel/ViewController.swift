//
//  ViewController.swift
//  CountableLabel
//
//  Created by Andrew Foghel on 1/23/19.
//  Copyright © 2019 StockX. All rights reserved.
//

import UIKit
import CountableLabel

class ViewController: UIViewController {
    
    private var currentValue = 0
    private var adjustingValue = 0
    
    @IBOutlet weak var countableLabel: CountableLabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    @IBAction func animationSegControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            countableLabel.animationType = .pushUp
        case 1:
            countableLabel.animationType = .pushDown
        case 2:
            countableLabel.animationType = .fade
        case 3:
            countableLabel.animationType = .none
        default:
            break
        }
    }
    
    @IBAction func textAlignmentSegControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            countableLabel.textAlignment = .left
        case 1:
            countableLabel.textAlignment = .center
        case 2:
            countableLabel.textAlignment = .right
        default:
            break
        }
        
        countableLabel.text = nil
        currentValue = 0
    }
    
    @IBAction func didTapIncrement(_ sender: Any) {
        currentValue += adjustingValue
        setCountableLabel(with: currentValue)
    }
    
    @IBAction func didTapDecrement(_ sender: Any) {
        currentValue -= adjustingValue
        setCountableLabel(with: currentValue)
    }
    
    private func setCountableLabel(with value: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let numberToSet = formatter.string(from: NSNumber(value: value))
        
        countableLabel.text = numberToSet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        valueTextField.delegate = self
        
        countableLabel.placeHolder = "--"
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text,
            let valueEntered = Int(text) {
            adjustingValue = valueEntered
        }
    }
    
}
