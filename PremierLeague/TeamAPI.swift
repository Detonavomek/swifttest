import Foundation

//Class to work with Wikipedia API
class TeamAPI: BaseAPI
{
    var team:Team
    
    init(teamName:String){
        //Create new team object and prepare to send JSON request to Wikipedia
        self.team = Team()
        super.init(urlPath: "https://en.wikipedia.org/w/api.php?action=parse&prop=text&page="+teamName+"&format=json")
    }
    
    func parse(){
        //Parse JSON
        
        //Get 'parse' key
        let resQueries = self.responseObj["parse"] as? [String: AnyObject]
        
        //Set name to 'title' key
        let name = resQueries!["title"] as? String
        
        //Set history to 'text'->'*' key and remove all HTML tage inside
        let historyText = resQueries!["text"] as? [String: AnyObject]
        let historyHtml = historyText!["*"] as? String
        let history = historyHtml!.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
            .stringByReplacingOccurrencesOfString("\n", withString: ".")

        //Create new team object
        self.team = Team(name: name, history: history, logo: "logo_tmp.png")
    }
}
