//
//  TableViewController.swift
//  SwiftHomepwner
//
//  Created by justin on 2015/01/04.
//  Copyright (c) 2015年 Justin. All rights reserved.
//

import UIKit

//class Item : NSObject {
//    
//    var name: String
//    var descriptionText: String
//    let serialNumber = NSUUID.init()
//    var imageFilename: String
//    var value: Float
//    let createDate = NSDate.init()
//    var modifiedDate: NSDate
//    
//    init(name: String, description: String, imageFilename: String, value: Float)
//    {
//        
//        self.name = name
//        self.descriptionText = description
//        self.imageFilename = imageFilename
//        self.value = value
//        self.modifiedDate = self.createDate
//        
//        println(self.serialNumber)
//        
//        super.init()
//    }
//    
//}

class TableViewController: UITableViewController
{
    
    var items: Array<AnyObject> = []
    let detailsVC = ItemDetailsViewController.init(nibName: "ItemDetails", bundle: NSBundle.mainBundle())

    
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet var imagesTableView: UITableView!
    @IBOutlet var combinedTableView: UITableView!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }

    required init(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        
        self.tabBarItem.title = "Items"
        
        self.tabBarItem.image = UIImage(named: "items")
        
        self.navigationItem.title = "Items"
        
        if let savedItems: NSData = NSUserDefaults.standardUserDefaults().valueForKey("Items") as? NSData {

            items = NSKeyedUnarchiver.unarchiveObjectWithData(savedItems) as Array

        }
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "editButtonPressed:")
        
        self.navigationItem.rightBarButtonItem = editButton
        
        let newButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "newButtonPressed:")
        
        self.navigationItem.leftBarButtonItem = newButton
        
        super.viewDidLoad()
                
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if let savedItems: NSData = NSUserDefaults.standardUserDefaults().valueForKey("Items") as? NSData {
            
            items = NSKeyedUnarchiver.unarchiveObjectWithData(savedItems) as Array
            
            self.tableView.reloadData()
            
        }

        super.viewDidAppear(animated)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item: Item = items[indexPath.row] as Item
        
        var cell: UITableViewCell
        
        
        if (tableView == self.imagesTableView? || tableView == self.combinedTableView?)
        {
            
            cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as TableViewCell

            if (tableView == self.imagesTableView?)
            {
                
                let topLevelObjects = NSBundle.mainBundle().loadNibNamed("ImagesTableViewCell", owner: TableViewCell.self, options: nil)
                
                for obj in topLevelObjects
                {
                    if obj.isMemberOfClass(TableViewCell)
                    {
                        cell = obj as TableViewCell
                    }
                    
                    break
                    
                }
                
            }
            else if (tableView == self.combinedTableView?)
            {
                
                let topLevelObjects = NSBundle.mainBundle().loadNibNamed("CombinedTableViewCell", owner: TableViewCell.self, options: nil)

                for obj in topLevelObjects
                {
                    if obj.isMemberOfClass(TableViewCell)
                    {
                        cell = obj as TableViewCell
                    }
                    
                    break
                    
                }
                
            }
            
            if let theSerialNumber = item.serialNumber as String?
            {
                
                let writableDirectory: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
                
                let path: String? = writableDirectory.stringByAppendingPathComponent(NSString(format: "%@.jpeg", theSerialNumber)) as String?
                
                if let thePath = path
                {
                 
                    if (NSFileManager.defaultManager().fileExistsAtPath(thePath))
                    {
                        
                        let data: NSData = NSData(contentsOfFile: thePath)!
                        
                        let itemImage = UIImage(data: data)
                        
                        (cell as TableViewCell).itemImageView?.image = itemImage
                    
                    }
                
                }
                    
                (cell as TableViewCell).captionLabel?.text = "\(item.name)"
                
                (cell as TableViewCell).nameLabel?.text = "\(item.name)"
                
                (cell as TableViewCell).descriptionLabel?.text = "\(item.descriptionText)"
                
            }
            
        }
        else
        {
            cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
            
            cell.textLabel?.text = item.name + " - " + item.descriptionText
        
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        var cellHeight: CGFloat = 44
        
        if (tableView == self.imagesTableView?)
        {
            
            cellHeight = tableView.frame.size.height
            
        }
        else if (tableView == self.combinedTableView?)
        {
            cellHeight = 150
        }
        
        return cellHeight
        
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        detailsVC.item = items[indexPath.row] as? Item
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            
            items.removeAtIndex(indexPath.row)
            
            tableView .deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.archiveItems()
        }
    }
    
    @IBAction func newButtonPressed(sender: AnyObject) {
        
        self.detailsVC.item = nil
        
        self.navigationController?.pushViewController(self.detailsVC, animated:true)
        
    }
    
    @IBAction func randomButtonPressed(sender: AnyObject)
    {
        
        let newItem = Item.init(name: "new item", description: "no description", value: 0)
        
        items += [newItem]
        
        let indexPath = NSIndexPath(forRow: items.count - 1, inSection: 0)
        
        //        self.tableView.reloadData()
        
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        self.archiveItems()
        
    }

    func archiveItems()
    {
        let archivedItems = NSKeyedArchiver.archivedDataWithRootObject(items)
        
        NSUserDefaults.standardUserDefaults().setValue(archivedItems, forKey: "Items")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func editButtonPressed(sender: AnyObject) {
        if (self.tableView.editing == true)
        {
            self.tableView.editing = false
        }
        else
        {
            self.tableView.editing = true

        }
    }
    
}
