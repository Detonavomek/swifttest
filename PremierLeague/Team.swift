import UIKit

struct Team {
    var name: String?
    var history: String?
    var players: String?
    var logo: String?
    
    init(name: String?, history: String?, players: String?, logo: String?) {
        self.name = name
        self.history = history
        self.players = players
        self.logo = logo
    }
}