import UIKit
import CoreData

import Foundation

class TeamCore: BaseCore {
    
    static func getTeams() -> [NSManagedObject]{
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Team")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            return results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return []
    }
    
    func updateTeams() {
        
        deleteEntityObjects("Team")
        
        let leagueTeams = LeagueTeamCore.getLeagueTeams()
        
        for leagueTeam in leagueTeams {
            let name = String(leagueTeam.valueForKey("name")!)
                            .stringByReplacingOccurrencesOfString(" ", withString: "%20")
                            .stringByReplacingOccurrencesOfString("AFC", withString: "A.F.C.")
                            .stringByReplacingOccurrencesOfString("FC", withString: "F.C.")
            let teamObj:TeamAPI=TeamAPI(teamName: name)
            teamObj.Req()
            teamObj.parse()
            teamObj.team.logo = String(leagueTeam.valueForKey("logo")!)
                            .stringByReplacingOccurrencesOfString("http", withString: "https")
            saveTeam(teamObj.team)
        }
        
        BaseCore.changeUpdateDate()
    }
    
    func saveTeam(team: Team) {
        let teamObj = preSave("Team")
        
        teamObj.setValue(team.name, forKey: "name")
        teamObj.setValue(team.history, forKey: "history")
        teamObj.setValue(team.logo, forKey: "logo")
        
        postSave()
    }
}
