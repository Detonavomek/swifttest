//
//  WelcomeController.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit
import CoreData

class WelcomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let teams = TeamCore.getTeams()
        if teams.count == 0 {
            let leagueTeamCore:LeagueTeamCore = LeagueTeamCore()
            leagueTeamCore.updateLeagueTeams()
            let teamCore:TeamCore = TeamCore()
            teamCore.updateTeams()
        }
        BaseCore.changeUpdateDate()
    }
    


}
