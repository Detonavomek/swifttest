import UIKit
import CoreData

//Welcome page view controller
class WelcomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //If user don't have any data(teams), load them
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
