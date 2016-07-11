import UIKit
import CoreData

import Foundation

class LeagueTeamCtrl {
    
    func changeUpdateDate() {
        let lastUpdateDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let DateInFormat:String = dateFormatter.stringFromDate(lastUpdateDate)
        LeagueData.lastUpdate = DateInFormat
    }
    
    func updateLeagueTeams() {
        let leagueTeamObj:LeagueTeamAPI=LeagueTeamAPI(urlPath: "http://api.football-data.org/v1/competitions/398/leagueTable")
        leagueTeamObj.Req()
        leagueTeamObj.parse()
        
        deleteLeagueTeams()
        for leagueTeam in leagueTeamObj.leagueTeams {
            saveLeagueTeam(leagueTeam)
        }
        
        changeUpdateDate()
    }
    
    func saveLeagueTeam(leagueTeam: LeagueTeam) {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("LeagueTeam",
                                                        inManagedObjectContext:managedContext)
        
        let leagueTeamObj = NSManagedObject(entity: entity!,
                                            insertIntoManagedObjectContext: managedContext)
        
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
        
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteLeagueTeams() {
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        let coord = appDel.persistentStoreCoordinator
        
        let fetchRequest = NSFetchRequest(entityName: "LeagueTeam")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coord.executeRequest(deleteRequest, withContext: context)
        } catch let error as NSError {
            debugPrint(error)
        }
    }

}
