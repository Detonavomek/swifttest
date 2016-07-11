//
//  LeagueTeamCell.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit

class LeagueTeamCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var PLabel: UILabel!
    @IBOutlet weak var WLabel: UILabel!
    @IBOutlet weak var DLabel: UILabel!
    @IBOutlet weak var LLabel: UILabel!
    @IBOutlet weak var GFLabel: UILabel!
    @IBOutlet weak var GALabel: UILabel!
    @IBOutlet weak var GDLabel: UILabel!
    @IBOutlet weak var PtsLabel: UILabel!
    
    var leagueTeam: LeagueTeam! {
        didSet {
            numberLabel.text = String(leagueTeam.number)
            nameLabel.text = leagueTeam.name
            PLabel.text = String(leagueTeam.P)
            WLabel.text = String(leagueTeam.W)
            DLabel.text = String(leagueTeam.D)
            LLabel.text = String(leagueTeam.L)
            GFLabel.text = String(leagueTeam.GF)
            GALabel.text = String(leagueTeam.GA)
            GDLabel.text = String(leagueTeam.GD)
            PtsLabel.text = String(leagueTeam.Pts)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
