import UIKit
import CoreData

import Foundation

class LeagueTeamCore: BaseCore {
    
    static func getLeagueTeams() -> [NSManagedObject] {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
    
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "LeagueTeam")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            return results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return []
    }
    
    func updateLeagueTeams() {
        let leagueTeamObj:LeagueTeamAPI=LeagueTeamAPI()
        leagueTeamObj.Req()
        leagueTeamObj.parse()
        
        deleteEntityObjects("LeagueTeam")
        for leagueTeam in leagueTeamObj.leagueTeams {
            saveLeagueTeam(leagueTeam)
        }
        
        BaseCore.changeUpdateDate()
    }
    
    func saveLeagueTeam(leagueTeam: LeagueTeam) {
        let leagueTeamObj = preSave("LeagueTeam")
        
        leagueTeamObj.setValue(leagueTeam.number, forKey: "number")
        leagueTeamObj.setValue(leagueTeam.name, forKey: "name")
        leagueTeamObj.setValue(leagueTeam.P, forKey: "p")
        leagueTeamObj.setValue(leagueTeam.W, forKey: "w")
        leagueTeamObj.setValue(leagueTeam.D, forKey: "d")
        leagueTeamObj.setValue(leagueTeam.L, forKey: "l")
        leagueTeamObj.setValue(leagueTeam.GF, forKey: "gf")
        leagueTeamObj.setValue(leagueTeam.GA, forKey: "ga")
        leagueTeamObj.setValue(leagueTeam.GD, forKey: "gd")
        leagueTeamObj.setValue(leagueTeam.Pts, forKey: "pts")
        leagueTeamObj.setValue(leagueTeam.logo, forKey: "logo")
        
        postSave()
    }
}
