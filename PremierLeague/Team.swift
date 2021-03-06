import UIKit

//Team structure with name, history and logo data
struct Team {
    var name: String?
    var history: String?
    var logo: String?
    
    init() {
        self.name = "name"
        self.history = "history"
        self.logo = "logo"
    }
    
    init(name: String?, history: String?, logo: String?) {
        self.name = name
        self.history = history
        self.logo = logo
    }
}