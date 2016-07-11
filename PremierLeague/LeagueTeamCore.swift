import UIKit
import CoreData

import Foundation

class LeagueTeamCore: BaseCore {
    
    func updateLeagueTeams() {
        let leagueTeamObj:LeagueTeamAPI=LeagueTeamAPI()
        leagueTeamObj.Req()
        leagueTeamObj.parse()
        
        deleteEntityObjects("LeagueTeam")
        for leagueTeam in leagueTeamObj.leagueTeams {
            saveLeagueTeam(leagueTeam)
        }
        
        changeUpdateDate()
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
        
        postSave()
    }
}
