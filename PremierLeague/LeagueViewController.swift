import UIKit
import CoreData

//Team list view controller
class LeagueViewController: UITableViewController {
    
    //Create empty team list
    var leagueTeams = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Add header to the table
        return "                                 P   W  D   L   GF  GA   GD   Pts"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Set row count equel to teams count
        return leagueTeams.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            //Get cell object
            let cell = tableView.dequeueReusableCellWithIdentifier("LeagueTeamCell", forIndexPath: indexPath) as! LeagueTeamCell
            
            //Get league team object
            let leagueTeam = leagueTeams[indexPath.row] as NSManagedObject
            
            //Set league team object to cell object
            cell.leagueTeam = leagueTeam
            
            return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        leagueTeams = LeagueTeamCore.getLeagueTeams()
    }

}
