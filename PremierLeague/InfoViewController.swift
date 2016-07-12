//
//  InfoViewController.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit
import CoreData

class InfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var logoWebView: UIWebView!

    var team:NSManagedObject!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = String(team.valueForKey("name")!)
        historyLabel.text = String(team.valueForKey("history")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var image=String(team.valueForKey("logo")!)
        if  let url:NSURL = NSURL(string: image){
            if let request: NSURLRequest = NSURLRequest(URL: url){
                let texttemp = "<img src="+image+" height=\"110\" width=\"110\"/>"
                logoWebView.loadHTMLString(texttemp, baseURL: url)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
