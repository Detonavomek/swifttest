import UIKit
import CoreData

import Foundation

class TeamCore: BaseCore {
    
    var leagueTeams = [NSManagedObject]()
    
    func getTeams() {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "LeagueTeam")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            leagueTeams = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func updateTeams() {
        
        deleteEntityObjects("Team")
        
        getTeams()
        
        for leagueTeam in leagueTeams {
            let name = String(leagueTeam.valueForKey("name")!)
                            .stringByReplacingOccurrencesOfString(" ", withString: "%20")
                            .stringByReplacingOccurrencesOfString("AFC", withString: "A.F.C.")
                            .stringByReplacingOccurrencesOfString("FC", withString: "F.C.")
            let teamObj:TeamAPI=TeamAPI(teamName: name)
            teamObj.Req()
            teamObj.parse()
            teamObj.team.logo = String(leagueTeam.valueForKey("number")!)
            saveTeam(teamObj.team)
        }
        
        changeUpdateDate()
    }
    
    func saveTeam(team: Team) {
        let teamObj = preSave("Team")
        
        teamObj.setValue(team.name, forKey: "name")
        teamObj.setValue(team.history, forKey: "history")
        teamObj.setValue(team.logo, forKey: "logo")
        
        postSave()
    }
}
