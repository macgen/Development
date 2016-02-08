//
//  DistanceConverterViewController.swift
//  SwiftConversion
//
//  Created by James Kim on 2/3/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class DistanceConverterViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var milesTextField: UITextField!
    @IBOutlet weak var kilosTextField: UITextField!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle? )
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    func calculateMilesToKilos(milesToConvert: Double) -> String
    {
       let kilos = "\(0.62137 / milesToConvert)"
       return kilos
    }
    
    func calculateKilosToMikes(kilosToConvert: Double) -> String
    {
        let miles = "\(kilosToConvert * 0.62137)"
        
        return miles
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == milesTextField
        {
            let miles: Double = (milesTextField.text! as NSString).doubleValue
            kilosTextField.text = calculateKilosToMikes(miles)
        }
        else if textField == kilosTextField
        {
            let kilos: Double = (kilosTextField.text! as NSString).doubleValue
            milesTextField.text = calculateKilosToMikes(kilos)
        }
        return true
    }
    
    
    
}