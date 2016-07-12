//
//  TeamCell.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit
import CoreData

class TeamCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoWebView: UIWebView!
    
    var team: NSManagedObject! {
        didSet {
            nameLabel.text = String(team.valueForKey("name")!)
            var image=String(team.valueForKey("logo")!)
            if  let url:NSURL = NSURL(string: image){
                if let request: NSURLRequest = NSURLRequest(URL: url){
                    let texttemp = "<img src="+image+" height=\"34\" width=\"34\"/>"
                    logoWebView.loadHTMLString(texttemp, baseURL: url)
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
