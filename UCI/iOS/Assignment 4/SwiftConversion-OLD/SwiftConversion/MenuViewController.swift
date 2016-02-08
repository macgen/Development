//
//  MenuViewController.swift
//  SwiftConversion
//
//  Created by James Kim on 2/4/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var viewControllers: Array<UIViewController>?
    
    init(viewControllers: Array<UIViewController>)
    {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
        
        (self.view as! UITableView).registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func loadView()
    {
        self.view = NSBundle.mainBundle().loadNibNamed("MenuViewController", owner: self, options: nil)[0] as! UITableView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print ("Number of itesm in the array \(viewControllers!.count)")
        return viewControllers!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        let viewController = viewControllers![indexPath.row]
        
        cell.textLabel?.text = viewController.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let selectedViewController = viewControllers![indexPath.row]
        
        self.navigationController?.pushViewController(selectedViewController, animated: true)
    }
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
