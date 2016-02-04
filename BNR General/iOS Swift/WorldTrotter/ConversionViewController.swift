//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by James Kim on 2/3/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheighValue: Double?
    {
        didSet
        {
            updateCelciusLable()
        }
    }
    
    var celciusValue: Double?
    {
        if let value = fahrenheighValue
        {
            return (value - 32) * 5/9
        }
        else
        {
            return nil
        }
    }
    
    @IBAction func fahrenheightFieldEditingChnaged (textField: UITextField)
    {
        if let text = textField.text, value = Double(text)
        {
            fahrenheighValue = value
        }
        else
        {
            celciusLabel.text = nil
        }
//        if let text = textField.text where !text.isEmpty
//        {
//            celciusLabel.text = text
//        }
//        else
//        {
//            celciusLabel.text = "???"
//        }
    }
    
    @IBAction func dismissKeyBoard (sender: AnyObject)
    {
        textField.resignFirstResponder()
    }
    
    func updateCelciusLable()
    {
        if let value = celciusValue
        {
            celciusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else
        {
            celciusLabel.text = "???"
        }
    }
    
    let numberFormatter: NSNumberFormatter =
    {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        
        return nf
    }()
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil
        {
            return false
        }
        else
        {
            return true
        }
        
    }
}
