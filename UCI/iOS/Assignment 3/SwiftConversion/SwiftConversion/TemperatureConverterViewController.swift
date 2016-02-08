//
//  TemperatureConverterViewController.swift
//  UCISwiftConverter
//
//  Created by justin on 2015/01/13.
//  Copyright (c) 2015年 Justin. All rights reserved.
//

import UIKit

class TemperatureConverterViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var celsiusTextField: UITextField!
    var conversions: Array<AnyObject> = []
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let favoriteBarButton = UIBarButtonItem (image: UIImage(named: "favoritesButton_60x60"), style: UIBarButtonItemStyle.Plain, target: self, action: "favoriteButtonPressed:")
        self.navigationItem.rightBarButtonItem = favoriteBarButton
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func calculateCelsius(fahrenheitTemp: Double) -> String
    {
        let celciusTemp = (fahrenheitTemp - 32) * 5 / 9
        self.createConversionObject(fahrenheitTemp, inputUnits: "F", outputValue: celciusTemp, outputUnits: "C")
        
        return "\(celciusTemp)"
    }
    
    
    func calculateFahrenheit(celciusTemp: Double) -> String
    {
        let fahrenheitTemp = (celciusTemp * 9 / 5 + 32)
        self.createConversionObject(celciusTemp, inputUnits: "C", outputValue: fahrenheitTemp, outputUnits: "F")
        
        return "\(fahrenheitTemp)"
    }
    
    func createConversionObject(inputValue: Double, inputUnits: String, outputValue: Double, outputUnits: String)
    {
        let favoriteConversion = Favorites(conversionType: "Temperature", inputValue: inputValue, inputUnits: inputUnits, outputValue: outputValue, outputUnits: outputUnits)
        conversions += [favoriteConversion]
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        if textField == fahrenheitTextField
        {
            
            let fahrenheitTemp: Double = (fahrenheitTextField.text! as NSString).doubleValue
            
            celsiusTextField.text = calculateCelsius(fahrenheitTemp)
            
        }
        else
        if textField == celsiusTextField
        {
            
            let celsiusTemp: Double = (celsiusTextField.text! as NSString).doubleValue
            
            fahrenheitTextField.text = calculateFahrenheit(celsiusTemp)
            
        }
        
        return true
    }
    
    func favoriteButtonPressed(sender: AnyObject)
    {
        if let data: NSData = NSUserDefaults.standardUserDefaults().objectForKey("FavoriteConversions") as? NSData
        {
            var savedFavorites: Array<AnyObject>  = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Array
            if conversions.count > 0
            {
                savedFavorites.append(conversions.last!)
                let updateFavorites = NSKeyedArchiver.archivedDataWithRootObject(savedFavorites)
                NSUserDefaults.standardUserDefaults().setValue(updateFavorites, forKey: "FavoriteConversions")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
    
}

