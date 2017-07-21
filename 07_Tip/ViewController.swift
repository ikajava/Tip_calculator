//
//  ViewController.swift
//  07_Tip
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var tipLabelPercentage: UILabel!
    @IBOutlet weak var tipLabelMoney: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    var tipPercent: Int = 15
    var base = Float()
    var text = String()
    
    func calculateTip(base: Float, percent: Int) -> (Float, Float) {
        var sum = Float()
        let tip: Float = base * Float(percent) / 100
        sum = base + tip
        return (sum, tip)
    }
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = Float(tipPercent)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resultTextField.resignFirstResponder()
    }
    
    @IBAction func textFieldEditEnd(_ sender: Any) {
        text = resultTextField.text!
        text = "$\(text)"
        resultTextField.text = text
    }
    
    @IBAction func textFieldTouch(_ sender: Any) {
        self.resultTextField.becomeFirstResponder()
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        tipPercent = Int(slider.value)
        if let resultTextField = resultTextField.text {
            
           let data = calculateTip(base: Float(resultTextField)!, percent: tipPercent)
            
           tipLabelPercentage.text = "Tip: (\(tipPercent)%)"
            tipLabelMoney.text = "\(data.1)"
            sumLabel.text = "\(data.0)"
            
            
        }
        
    }

}

