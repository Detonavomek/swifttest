//
//  SettingsViewController.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var updateTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateData(sender: AnyObject) {
        let leagueTeamCtrl:LeagueTeamCore = LeagueTeamCore()
        leagueTeamCtrl.updateLeagueTeams()
        let teamCtrl:TeamCore = TeamCore()
        teamCtrl.updateTeams()
        updateTimeLabel.text = "Last update: " + LeagueData.lastUpdate
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel.text = "Last update: " + LeagueData.lastUpdate
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
