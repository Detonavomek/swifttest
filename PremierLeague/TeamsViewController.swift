import UIKit
import CoreData


//Team list view controller
class TeamsViewController: UITableViewController {
    
    //Create empty team list
    var teams = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return teams.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            //Get cell object
            let cell = tableView.dequeueReusableCellWithIdentifier("TeamCell", forIndexPath: indexPath) as! TeamCell
            
            //Get team object
            let team = teams[indexPath.row] as NSManagedObject
            
            //Set team object to cell object
            cell.team = team
            return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //Get list of teams
        teams = TeamCore.getTeams()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Go to detailed page
        if  segue.identifier == "infoSegue",
            let destination = segue.destinationViewController as? InfoViewController,
            infoIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.team = teams[infoIndex]
        }
    }
}
