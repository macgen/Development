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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var panHandleHolder: UIView!
    @IBOutlet weak var panHandle: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var conversions: Array<AnyObject> = []
    var currentValue: CGFloat?
    
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
    
    @IBAction func cameraActionPressed(sender: AnyObject)
    {
        let imagePicker = UIImagePickerController()
        //imagePicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(.Camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        }
        else
        {
            imagePicker.sourceType = .SavedPhotosAlbum
        }
        
        presentViewController(imagePicker, animated:  true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imageView.image = info["UIImagePickerControllerOrignalImage"] as? UIImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        picker.dismissViewControllerAnimated(true, completion: nil)
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
        let alert = UIAlertController(title: "Name this favorite?", message: "Enter a name to help remeber this conversion.", preferredStyle: UIAlertControllerStyle.Alert)
        var nameTextField = UITextField()
        alert.addTextFieldWithConfigurationHandler {(nameTextField) -> Void in
            nameTextField.delegate = self
            let save = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                (self.conversions.last! as! Favorites).favoriteTitle = nameTextField.text as String?
                    self.savedFavorite()
                })
            
                alert.addAction(save)
            
                let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:{(action) -> Void in
                    alert.dismissViewControllerAnimated(true, completion: nil)
                })
            
                alert.addAction(cancel)
                }
        
                self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func savedFavorite()
    {
        var image = imageView.image
        
        let imageData = UIImageJPEGRepresentation(image!, 1.0)
        
        (conversions.last! as! Favorites).imageData = imageData
        
        if let data: NSData = NSUserDefaults.standardUserDefaults().objectForKey("FavoriteConversions") as? NSData
        {
            var savedFavorites: Array<AnyObject> = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Array
        
            if self.conversions.count > 0
            {
                savedFavorites.append(conversions.last!)
                let updatedFavorites = NSKeyedArchiver.archivedDataWithRootObject(savedFavorites)
                NSUserDefaults.standardUserDefaults().setValue(updatedFavorites, forKey: "FavoriteConversions")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
    
    @IBAction func plusButtonPressed(sender: AnyObject)
    {
        let currentValue: Float = ((fahrenheitTextField.text)! as NSString).floatValue
        let newValue = currentValue + 0.5
        
        fahrenheitTextField.text = "\(newValue)"
        celsiusTextField.text = calculateCelsius(Double(newValue))
    }
    
    
    @IBAction func minusButtonPressed(sender: AnyObject)
    {
        let currentValue: Float = ((fahrenheitTextField.text)! as NSString).floatValue
        let newValue = currentValue - 0.5
        
        fahrenheitTextField.text = "\(newValue)"
        celsiusTextField.text = calculateCelsius(Double(newValue))

        
    }
    
    
    
//            
//        if let data: NSData = NSUserDefaults.standardUserDefaults().objectForKey("FavoriteConversions") as? NSData
//        {
//            var savedFavorites: Array<AnyObject>  = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Array
//            if conversions.count > 0
//            {
//                savedFavorites.append(conversions.last!)
//                let updateFavorites = NSKeyedArchiver.archivedDataWithRootObject(savedFavorites)
//                NSUserDefaults.standardUserDefaults().setValue(updateFavorites, forKey: "FavoriteConversions")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//        }
    }
    


