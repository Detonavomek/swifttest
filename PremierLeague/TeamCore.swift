import UIKit
import CoreData

import Foundation

//Team class work with CoreData
class TeamCore: BaseCore {
    
    static func getTeams() -> [NSManagedObject]{
        //Get list of teams
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Team")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            //Return list of teams as NSManagedObjects
            return results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return []
    }
    
    func updateTeams() {
        //Update teams
        
        //Clean information about teams in CoreData
        deleteEntityObjects("Team")
        
        //Get league teams
        let leagueTeams = LeagueTeamCore.getLeagueTeams()
        
        // For each league team
        for leagueTeam in leagueTeams {
            //Prepare name leagueTeam.name to HTTP wikipedia request(change whitespaces and abbreviations)
            let name = String(leagueTeam.valueForKey("name")!)
                            .stringByReplacingOccurrencesOfString(" ", withString: "%20")
                            .stringByReplacingOccurrencesOfString("AFC", withString: "A.F.C.")
                            .stringByReplacingOccurrencesOfString("FC", withString: "F.C.")
            
            //Generate and save team object
            let teamObj:TeamAPI=TeamAPI(teamName: name)
            teamObj.Req()
            teamObj.parse()
            teamObj.team.logo = String(leagueTeam.valueForKey("logo")!)
                            .stringByReplacingOccurrencesOfString("http", withString: "https")
            saveTeam(teamObj.team)
        }
        
        //Update last update datetime
        BaseCore.changeUpdateDate()
    }
    
    func saveTeam(team: Team) {
        //Save team to SQLite database using CoreData
        let teamObj = preSave("Team")
        
        teamObj.setValue(team.name, forKey: "name")
        teamObj.setValue(team.history, forKey: "history")
        teamObj.setValue(team.logo, forKey: "logo")
        
        postSave()
    }
}
