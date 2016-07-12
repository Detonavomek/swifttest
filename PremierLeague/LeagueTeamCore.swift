import UIKit
import CoreData

import Foundation

//League team class work with CoreData
class LeagueTeamCore: BaseCore {
    
    static func getLeagueTeams() -> [NSManagedObject] {
        //Get list of league teams
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
    
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "LeagueTeam")
        
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            //Return list of teams as NSManagedObjects
            return results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return []
    }
    
    func updateLeagueTeams() {
        //Generate league team object
        let leagueTeamObj:LeagueTeamAPI=LeagueTeamAPI()
        leagueTeamObj.Req()
        leagueTeamObj.parse()
        
        //Clean information about league teams in CoreData
        deleteEntityObjects("LeagueTeam")
        
        for leagueTeam in leagueTeamObj.leagueTeams {
            //Save league team object
            saveLeagueTeam(leagueTeam)
        }
        
        //Update last update datetime
        BaseCore.changeUpdateDate()
    }
    
    func saveLeagueTeam(leagueTeam: LeagueTeam) {
        //Save team to SQLite database using CoreData
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
