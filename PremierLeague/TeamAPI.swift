import Foundation

class TeamAPI: BaseAPI
{
    var team:Team
    
    init(teamName:String){
        self.team = Team()
        super.init(urlPath: "https://en.wikipedia.org/w/api.php?action=parse&prop=text&page="+teamName+"&format=json")
    }
    
    func parse(){
        let resQueries = self.responseObj["parse"] as? [String: AnyObject]
        
        let name = resQueries!["title"] as? String
        
        let historyText = resQueries!["text"] as? [String: AnyObject]
        let historyHtml = historyText!["*"] as? String
        let history = historyHtml!.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
            .stringByReplacingOccurrencesOfString("\n", withString: ".")

        self.team = Team(name: name, history: history, logo: "logo1.png")
    }
}
