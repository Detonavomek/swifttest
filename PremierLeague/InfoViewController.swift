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

    var team:NSManagedObject!
    
    func imageForLofo(logo:String) -> UIImage? {
        let imageName = "teams"
        return UIImage(named: imageName)
    }

    override func viewWillAppear(animated: Bool) {
        nameLabel.text = String(team.valueForKey("name")!)
        historyLabel.text = String(team.valueForKey("history")!)
        logoImage.image = imageForLofo(String(team.valueForKey("logo")!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
