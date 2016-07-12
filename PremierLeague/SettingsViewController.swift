import UIKit
import CoreData

//Settings page view controller
class SettingsViewController: UIViewController {
    
    //Bind view objects
    @IBOutlet weak var updateTimeLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func updateData(sender: AnyObject) {
        //Disable update button
        updateButton.enabled = false
        
        //Update teams and league teams
        let leagueTeamCtrl:LeagueTeamCore = LeagueTeamCore()
        leagueTeamCtrl.updateLeagueTeams()
        let teamCtrl:TeamCore = TeamCore()
        teamCtrl.updateTeams()
        
        //Update time label
        updateTimeLabel.text = "Last update: " + LeagueData.lastUpdate
        
        //Enable update button
        updateButton.enabled = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //Update time label
        updateTimeLabel.text = "Last update: " + LeagueData.lastUpdate
    }
}
