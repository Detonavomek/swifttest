import Foundation

class LeagueTeamAPI
{
    
    var urlPath: String
    var url: NSURL
    var request1: NSURLRequest
    var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>
    var responseObj: [String: AnyObject]
    var leagueTeams:[LeagueTeam]
    
    init(urlPath:String){
        self.urlPath = urlPath
        self.url = NSURL(string: urlPath)!
        self.request1 = NSURLRequest(URL: url)
        self.response=nil
        self.responseObj = [:];
        self.leagueTeams = [LeagueTeam]()
    }
    
    func Req(){
        do{
            let dataVal = try NSURLConnection.sendSynchronousRequest(request1, returningResponse: response)
            if let jsonResult = try NSJSONSerialization.JSONObjectWithData(dataVal, options: []) as? NSDictionary {
                self.responseObj = (jsonResult as? [String: AnyObject])!
            }
        }catch let error as ErrorType{
            print(error)
        }
    }
    
    func parse(){
        let teams = self.responseObj["standing"] as? [[String: AnyObject]]

        for team in teams! {
            guard let position = team["position"] as? Int,
                let name = team["teamName"] as? String,
                let playedGames = team["playedGames"] as? Int,
                let wins = team["wins"] as? Int,
                let draws = team["draws"] as? Int,
                let losses = team["losses"] as? Int,
                let goals = team["goals"] as? Int,
                let goalsAgainst = team["goalsAgainst"] as? Int,
                let goalDifference = team["goalDifference"] as? Int,
                let points = team["points"] as? Int  else { break }
            
            self.leagueTeams.append(LeagueTeam(number: position,name: name,P: playedGames,W: wins,D: draws,L: losses,GF: goals,GA: goalsAgainst,GD: goalDifference,Pts: points))
        }
    }
}
