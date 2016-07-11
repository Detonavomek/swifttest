//
//  SampleData.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import Foundation

//Set up sample data

let teamsData = [
    Team(name:"name 1", history:"big history 1", players: "1", logo: "logo1.png"),
    Team(name:"name 2", history:"big history 2", players: "2", logo: "logo2.png"),
    Team(name:"name 3", history:"big history 3", players: "3", logo: "logo3.png"),
    Team(name:"name 4", history:"big history 4", players: "4", logo: "logo4.png"),
]

let leagueTeamsData = [
    LeagueTeam(number: 1, name:"name 111877787", P:1, W:1, D:1, L:1, GF:1, GA:1, GD:1, Pts:1),
    LeagueTeam(number: 22, name:"name 2", P:2, W:2, D:2, L:2, GF:2, GA:2, GD:2, Pts:2),
    LeagueTeam(number: 3, name:"n", P:3, W:33, D:3, L:3, GF:3, GA:3, GD:3, Pts:-3),
    LeagueTeam(number: 4, name:"name 4", P:4, W:4, D:4, L:4, GF:4, GA:4, GD:10, Pts:4)
]