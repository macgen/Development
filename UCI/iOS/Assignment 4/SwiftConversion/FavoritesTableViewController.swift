//
//  FavoritesTableViewController.swift
//  SwiftConversion
//
//  Created by James Kim on 2/6/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController
{
    var favorites: Array<AnyObject> = []
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "Favorites"
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override func viewWillAppear(animated: Bool)
    {
        if let data: NSData = NSUserDefaults.standardUserDefaults().objectForKey("FavoriteConversions") as? NSData
        {
            if let savedFavorites: Array<AnyObject> = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Array
            {
                self.favorites = savedFavorites
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let cell = UITableViewCell(style:  UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        let favorite: Favorites = favorites[indexPath.row] as! Favorites
        
        cell.textLabel!.text = NSString(format: "%f%d = %f%d", favorite.inputValue, favorite.inputUnits, favorite.outputValue, favorite.outputUnits) as String
        cell.detailTextLabel!.text = favorite.favoriteTitle
        
        if let imgData = favorite.imageData
        {
            cell.imageView?.image = UIImage(data: imgData, scale: 1.0)
        }
        
        return cell
    }


    
}
