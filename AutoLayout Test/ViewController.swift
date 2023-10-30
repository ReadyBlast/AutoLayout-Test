//
//  ViewController.swift
//  AutoLayout Test
//
//  Created by XE on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var lcTopMargin: NSLayoutConstraint!
    @IBOutlet private weak var rectanglesSV: UIStackView!
    @IBOutlet private weak var mValueTextField: UITextField!
    @IBOutlet private weak var spacingSliderValue: UISlider!
    @IBOutlet private weak var lcButtonTopMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sliderSetup()
        
        mValueTextField.delegate = self
        mValueTextField.keyboardType = .decimalPad
    }

    @IBAction private func sliderValueChanged(_ sender: Any) {
        rectanglesSV.spacing = CGFloat(spacingSliderValue.value)
    }
    
    @IBAction private func setupPressed(_ sender: Any) {
        hideKeyboard()
    }
    
    private func sliderSetup() {
        spacingSliderValue.minimumValue = 10
        spacingSliderValue.maximumValue = 110
        spacingSliderValue.value = 50
    }
    
    private func hideKeyboard() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
        mValueTextField.text = ""
    }
    
    @IBAction func backToFirstController(_ sender: UIStoryboardSegue) {
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        lcTopMargin.constant = CGFloat(Double(textField.text!) ?? 0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
}

