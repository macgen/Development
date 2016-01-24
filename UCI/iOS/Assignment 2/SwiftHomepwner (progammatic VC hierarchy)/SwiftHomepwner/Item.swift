//
//  Item.swift
//  SwiftHomepwner
//
//  Created by justin on 2015/01/04.
//  Copyright (c) 2015年 Justin. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding {
    
    var name: String = ""
    var descriptionText: String = ""
    let serialNumber: String = NSUUID.init().UUIDString
    var value: NSNumber = 0
    let createDate = NSDate.init()
    var modifiedDate: NSDate = NSDate.init()
    
    init (name: String, description: String, value: NSNumber)
    {
        
        self.name = name
        self.descriptionText = description
        self.value = value
        self.modifiedDate = self.createDate

        println(self.serialNumber)
        
        super.init()
    }

    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: "Name")
       
        aCoder.encodeObject(descriptionText, forKey: "DescriptionText")
        
        aCoder.encodeObject(serialNumber, forKey: "SerialNumber")
        
        aCoder.encodeObject(value, forKey: "Value")
        
        aCoder.encodeObject(createDate, forKey: "CreateDate")
        
        aCoder.encodeObject(modifiedDate, forKey: "ModifiedDate")
        
    }
    
    required init(coder aDecoder: NSCoder) {
        
        name = aDecoder.decodeObjectForKey("Name") as String
        
        descriptionText = aDecoder.decodeObjectForKey("DescriptionText") as String
        
        serialNumber = aDecoder.decodeObjectForKey("SerialNumber") as String
        
        value = aDecoder.decodeObjectForKey("Value") as NSNumber
        
        createDate = aDecoder.decodeObjectForKey("CreateDate") as NSDate
        
        modifiedDate = aDecoder.decodeObjectForKey("ModifiedDate") as NSDate
        
    }
}
