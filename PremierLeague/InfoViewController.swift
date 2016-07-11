//
//  InfoViewController.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!

    var team:Team!
    
    func imageForLofo(logo:String) -> UIImage? {
        let imageName = "teams"
        return UIImage(named: imageName)
    }

    override func viewWillAppear(animated: Bool) {
        nameLabel.text = team.name
        historyLabel.text = team.history
        playersLabel.text = team.players
        logoImage.image = imageForLofo(team.logo!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
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
