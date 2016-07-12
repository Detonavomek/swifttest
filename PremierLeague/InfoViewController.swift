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
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var webView: UIWebView!

    var team:NSManagedObject!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = String(team.valueForKey("name")!)
        historyLabel.text = String(team.valueForKey("history")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/en/6/63/Leicester02.png") {
            if let data = NSData(contentsOfURL: url) {
                logoImage.image = UIImage(data: data)
            }        
        }
//        var url:NSURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/en/6/63/Leicester02.png")!
//        var request: NSURLRequest = NSURLRequest(URL: url)
//        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
