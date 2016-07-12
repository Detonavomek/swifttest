import UIKit

struct LeagueTeam {
    var number: Int
    var name: String?
    var P: Int
    var W: Int
    var D: Int
    var L: Int
    var GF: Int
    var GA: Int
    var GD: Int
    var Pts: Int
    var logo: String?
    
    init(number: Int, name: String?, P: Int, W: Int, D: Int, L: Int, GF: Int, GA: Int, GD: Int, Pts: Int, logo: String?) {
        self.number = number
        self.name = name
        self.P = P
        self.W = W
        self.D = D
        self.L = L
        self.GF = GF
        self.GA = GA
        self.GD = GD
        self.Pts = Pts
        self.logo = logo
    }
}