//
//  ViewController.swift
//  Calculator
//
//  Created by Deb Santa Clara on 3/04/19.
//  Copyright © 2019 Deb Santa Clara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayState: Numbers!
    var sign: Signs!
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        resetButtonColour()
        let number = sender.title(for: .normal)!
        displayState.displayString(number)
        displayLabel.text = displayState.display
        acButton.isHidden = true
        cancelButton.isHidden = false
    }
    
    @IBAction func acButtonTapped(_ sender: UIButton) {
        reset()
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        displayState.display = ""
        displayLabel.text = "0"
        
    }
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
       displayState.changeSign(displayState.display)
        displayLabel.text = displayState.display
    }
    @IBAction func percentButtonTapped(_ sender: UIButton) {
        
    }
    @IBAction func divideButtonTapped(_ sender: UIButton) {
        sign = Signs.divide
        signButtonTapped(.divide)
        resetButtonColour()
        signButtonColourChange(sign)
    }
    @IBAction func multiplyButtonTapped(_ sender: UIButton) {
        sign = Signs.multiply
        signButtonTapped(.multiply)
        resetButtonColour()
        signButtonColourChange(sign)
    }
    @IBAction func addButtonTapped(_ sender: UIButton) {
        sign = Signs.add
        signButtonTapped(.add)
        resetButtonColour()
        signButtonColourChange(sign)
    }
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        sign = Signs.subtract
        signButtonTapped(.subtract)
        resetButtonColour()
        signButtonColourChange(sign)
    }
    
    
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        whenEqualsSignPressed(sign)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reset()
    }
    
    func reset() {
        displayState = Numbers(display: "", storeNumber1: 0, storeNumber2: 0, storeNumber3: 0)
        displayLabel.text = "0"
        resetButtonColour()
    }
    
    func signButtonTapped(_ sign: Signs) {
        displayState.storeFirstNum(displayState.display)
        displayState.display = ""
        
    }

    func whenEqualsSignPressed(_ sign: Signs) {
        displayState.storeSecondNum(displayState.display)
        
        switch sign {
        case .add:
            displayState.storeNumber1 += displayState.storeNumber2
        case .divide:
            displayState.storeNumber1 /= displayState.storeNumber2
        case .multiply:
            displayState.storeNumber1 *= displayState.storeNumber2
        case .subtract:
            displayState.storeNumber1 -= displayState.storeNumber2
        }
        
        displayState.displayAnswer(displayState.storeNumber1)
        displayLabel.text = displayState.display
        displayState.display = ""
        displayState.storeNumber3 = displayState.storeNumber1
    }
    
    func resetButtonColour() {
        divideButton.backgroundColor = UIColor(red: 0.87, green: 0.65, blue: 0.51, alpha: 1)
        multiplyButton.backgroundColor = UIColor(red: 0.87, green: 0.65, blue: 0.51, alpha: 1)
        addButton.backgroundColor = UIColor(red: 0.87, green: 0.65, blue: 0.51, alpha: 1)
        minusButton.backgroundColor = UIColor(red: 0.87, green: 0.65, blue: 0.51, alpha: 1)
    }
    
    func signButtonColourChange(_ sign: Signs) {
        switch sign {
        case .add:
            addButton.backgroundColor = UIColor.white
        case .divide:
            divideButton.backgroundColor = UIColor.white
        case .multiply:
            multiplyButton.backgroundColor = UIColor.white
        case .subtract:
            minusButton.backgroundColor = UIColor.white
        }
    }
    
}

/*
 Display numbers as they are typed
 Store whole number as 'first number' when a 'sign' button is typed
 Display sign button
 Store sign button
 If sign button is changed, display and store that sign instead
 Display new numbers as they are typed, store in 'second number'
 When equals button pressed, do the calculation (ie 'first number' 'sign' 'second number', and display the result, store the result as 'first number'
 
 ADDING THE COMPLEXITY
 - perform 'percent' calculation when % sign pressed
 - make number +/- when this is pressed (this may change how to code the calculation?)
 - reset to start when A/C button is pressed
 - make a 'cancel button' so that first or second number can be changed
 - work out how to make it decimal when the . button is pressed
 
 */
