import Foundation

//Class to work with football-data.org API
class LeagueTeamAPI: BaseAPI
{
    
    var leagueTeams:[LeagueTeam]
    
    init(){
        //Create league team list and prepare to send JSON request to football-data.org
        self.leagueTeams = [LeagueTeam]()
        super.init(urlPath: "http://api.football-data.org/v1/competitions/398/leagueTable")
    }
    
    func parse(){
        //Parse JSON
        
        //Get 'standing' key(array)
        let teams = self.responseObj["standing"] as? [[String: AnyObject]]

        for team in teams! {
            //Fill information from array item data
            guard let position = team["position"] as? Int,
                let name = team["teamName"] as? String,
                let logo = team["crestURI"] as? String,
                let playedGames = team["playedGames"] as? Int,
                let wins = team["wins"] as? Int,
                let draws = team["draws"] as? Int,
                let losses = team["losses"] as? Int,
                let goals = team["goals"] as? Int,
                let goalsAgainst = team["goalsAgainst"] as? Int,
                let goalDifference = team["goalDifference"] as? Int,
                let points = team["points"] as? Int  else { break }
            
            //Add array item to league data
            self.leagueTeams.append(LeagueTeam(number: position,name: name,P: playedGames,W: wins,D: draws,L: losses,GF: goals,GA: goalsAgainst,GD: goalDifference,Pts: points, logo: logo))
        }
    }
}
