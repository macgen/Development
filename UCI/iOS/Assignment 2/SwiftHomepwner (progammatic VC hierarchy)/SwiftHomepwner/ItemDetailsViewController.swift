//
//  ItemDetailsViewController.swift
//  SwiftHomepwner
//
//  Created by justin on 2015/01/04.
//  Copyright (c) 2015年 Justin. All rights reserved.
//

import UIKit

class ItemDetailsViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate
{
    
    var imageFilename = ""
    
    var itemImage: UIImage!
    
    var itemImageScrollView: UIScrollView!
    
    var imageView: UIImageView!
    
    var _item: Item? = nil
    
    var item: Item? {
        
        get
        {
            
            return _item
            
        }
        
        set (newValue)
        {
            
            if (_item != newValue)
            {
                
                _item = newValue
                
            }
            
        }
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var valueInDollarsTextField: UITextField!
    
    override func viewDidLoad() {
        
        let saveButton = UIBarButtonItem.init(title: "Save",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: "save")
        
        self.navigationItem.rightBarButtonItem = saveButton
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if let name = _item?.name
        {
            
            nameTextField?.text = name
            
            self.navigationItem.title = _item?.name

            
        }
        else
        {
            
            nameTextField?.text = ""
            
            self.navigationItem.title = ""

            
        }
        
        if let desc = _item?.descriptionText
        {
            
            descriptionTextView?.text = desc
            
        }
        else
        {
            
            descriptionTextView?.text = ""
            
        }
        
        if let value = _item?.value
        {
            
            valueInDollarsTextField?.text = NSString(format: "%.2f", value as Float)
            
        }
        else
        {
            
            valueInDollarsTextField?.text = ""
            
        }
        
        if let serialNumber = _item?.serialNumber
        {
            
            self.showImage(nil)
            
        }
    
        super.viewWillAppear(animated)
    
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        itemImage = nil
        imageView?.image = nil
        
    }
    
    func showImage(path: String!)
    {
        
        self.createItem()
        
        var thePath: String! = ""
        
        if let aFilename = path
        {
            
            thePath = aFilename
            
        }
        else
        if let theSerialNumber = _item?.serialNumber
        {
            
            let writableDirectory: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
            
            thePath = writableDirectory.stringByAppendingPathComponent(NSString(format: "%@.jpeg", theSerialNumber))
            
        }
        
        // now, save the selected itemImage to disk inside our application sandbox and use the serial number of the newly-created item to create and serialize the filename...
        
        if let theImage = itemImage
        {
            
            let imageData = UIImageJPEGRepresentation(theImage, 1.0)
            
            let writableDirectory: NSString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
            
            let filename = _item?.serialNumber
            
            let path: NSString = writableDirectory.stringByAppendingPathComponent(NSString(format: "%@.jpeg", filename!) as NSString)
            
            imageData.writeToFile(path, atomically: true)
            
        }

        // now that we've saved the image, go get is and add it to the UI...
        if (NSFileManager.defaultManager().fileExistsAtPath(thePath!))
        {
            
            let data: NSData = NSData(contentsOfFile: thePath)!
            
            itemImage = UIImage(data: data)
            
            let imageWidth = self.view.bounds.size.width / 3
            
            let imageViewFrame = CGRectMake(0,
                0, imageWidth * 2,
                imageWidth * 2 / (self.view.frame.size.width / self.view.frame.size.height))
            
            imageView = UIImageView(frame: imageViewFrame)
            
            imageView.image = itemImage
            
            imageView.contentMode = UIViewContentMode.ScaleToFill
            
            itemImageScrollView = UIScrollView(frame: CGRectMake(self.view.bounds.size.width / 2 - imageWidth / 2,
                valueInDollarsTextField.frame.origin.y + valueInDollarsTextField.frame.size.height + 20,
                imageViewFrame.width / 2,
                imageViewFrame.height / 2))
            
            itemImageScrollView.delegate = self
            
            itemImageScrollView.minimumZoomScale = 1.0
            
            itemImageScrollView.maximumZoomScale = 3.0
            
//            itemImageScrollView.backgroundColor = UIColor.redColor()
            
//            imageView.backgroundColor = UIColor.yellowColor()
            
            itemImageScrollView.contentSize = CGSize(width: imageViewFrame.size.width, height: imageViewFrame.size.height)
            
            itemImageScrollView.scrollEnabled = true
            
            itemImageScrollView.showsHorizontalScrollIndicator = true
            
            itemImageScrollView.showsVerticalScrollIndicator = true
            
            itemImageScrollView.addSubview(imageView)
            
            self.view.addSubview(itemImageScrollView)
            
        }
        else
        {
            println("No image found!")
        }

    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        
        
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {

        var returnView: UIView? = nil
        
        if scrollView == itemImageScrollView?
        {
            returnView = imageView
        }
        
        return returnView
        
    }
    
    func updateItem()
    {
        
        _item?.name = nameTextField.text
        
        _item?.descriptionText = descriptionTextView.text
        
        _item?.value = NSNumber.init(float: (self.valueInDollarsTextField.text as NSString).floatValue)
        
        _item?.modifiedDate = NSDate.init()
        
    }
    
    func createItem()
    {
        
        if let aSerialNumber = item?.serialNumber
        {
            
            self.updateItem()
            
        }
        else
        {
        
            let value = NSNumber.init(float: (self.valueInDollarsTextField.text as NSString).floatValue)
            
            _item = Item.init(name: nameTextField.text, description: descriptionTextView.text, value:value)

        }
        
    }
    
    func save()
    {
        
        // serialize all the properties of the Item object...
        if _item == nil
        {
            
            self.createItem()
            
        }
        else
        {
            self.updateItem()
        }
        
        // now read the items array from disk so we can save our newItem into it...
        
        var items: Array<NSObject>
        
        if let savedItems: NSData = NSUserDefaults.standardUserDefaults().valueForKey("Items") as? NSData {
        
            items = NSKeyedUnarchiver.unarchiveObjectWithData(savedItems) as Array
        
        }
        else
        {
            items = []
        }
        
        items += [_item!]
        
        let archivedItems = NSKeyedArchiver.archivedDataWithRootObject(items)
        
        NSUserDefaults.standardUserDefaults().setValue(archivedItems, forKey: "Items")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addImageButtonPressed(sender: AnyObject)
    {
    
        let imagePickerController: UIImagePickerController = UIImagePickerController.init()
        
        imagePickerController.delegate = self
        
        if ((UIImagePickerController.availableMediaTypesForSourceType(UIImagePickerControllerSourceType.Camera)) != nil)
        {
        
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        
        }
        else
        {
        
            imagePickerController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        
        }
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!)
    {
        
        itemImage = image
        
        self.createItem()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {

        if (textField.isFirstResponder())
        {
            
            textField.resignFirstResponder()
            
        }
        
        return true
        
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        if (textView.isFirstResponder())
        {
            
            textView.resignFirstResponder()
            
        }
        
    }
    
}