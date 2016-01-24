//
//  TableViewCell.swift
//  SwiftHomepwner
//
//  Created by justin on 2015/01/11.
//  Copyright (c) 2015年 Justin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func layoutSubviews() {
        
        let labelHeight: CGFloat = 20
        
        let kTabBarHeight: CGFloat = 60
        
        captionLabel?.frame = CGRect(origin: CGPoint(x: 10, y: self.frame.size.height - kTabBarHeight - labelHeight), size: CGSize(width: self.frame.size.width - 20, height: labelHeight))
        
    }
    
}
