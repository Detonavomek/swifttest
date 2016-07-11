//
//  LeagueTeamCell.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit
import CoreData

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
    
    var leagueTeam: NSManagedObject! {
        didSet {
            numberLabel.text = String(leagueTeam.valueForKey("number")!)
            nameLabel.text = String(leagueTeam.valueForKey("name")!)
            PLabel.text = String(leagueTeam.valueForKey("p")!)
            WLabel.text = String(leagueTeam.valueForKey("w")!)
            DLabel.text = String(leagueTeam.valueForKey("d")!)
            LLabel.text = String(leagueTeam.valueForKey("l")!)
            GFLabel.text = String(leagueTeam.valueForKey("gf")!)
            GALabel.text = String(leagueTeam.valueForKey("ga")!)
            GDLabel.text = String(leagueTeam.valueForKey("gd")!)
            PtsLabel.text = String(leagueTeam.valueForKey("pts")!)
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
