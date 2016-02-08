//
//  VolumetricConverterViewController.swift
//  SwiftConversion
//
//  Created by James Kim on 2/3/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class VolumetricConverterViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var litersTextField: UITextField!
    @IBOutlet weak var gallonsTextField: UITextField!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    func calculateLitersToGallons (litersToConvert: Double) -> String
    {
        let liters = "\(litersToConvert * 0.264172052)"
        return liters
    }
    
    func calculateGallonsToLiters (gallonsToConvert: Double) -> String
    {
        let gallons = "\(gallonsToConvert / 0.264172052)"
        return gallons
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == litersTextField
        {
            let liters: Double = (litersTextField.text! as NSString).doubleValue
            gallonsTextField.text = calculateLitersToGallons(liters)
        }
        else if textField == gallonsTextField
        {
            let gallons: Double = (gallonsTextField.text! as NSString).doubleValue
            litersTextField.text = calculateGallonsToLiters(gallons)
        }
        
        return true
    }
    
    
}
