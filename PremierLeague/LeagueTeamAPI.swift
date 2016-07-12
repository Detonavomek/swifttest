import Foundation

class LeagueTeamAPI: BaseAPI
{
    
    var leagueTeams:[LeagueTeam]
    
    init(){
        self.leagueTeams = [LeagueTeam]()
        super.init(urlPath: "http://api.football-data.org/v1/competitions/398/leagueTable")
    }
    
    func parse(){
        let teams = self.responseObj["standing"] as? [[String: AnyObject]]

        for team in teams! {
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
            
            self.leagueTeams.append(LeagueTeam(number: position,name: name,P: playedGames,W: wins,D: draws,L: losses,GF: goals,GA: goalsAgainst,GD: goalDifference,Pts: points, logo: logo))
        }
    }
}
