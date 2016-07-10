//
//  TeamCell.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    func imageForLofo(logo:String) -> UIImage? {
//        let imageName = "logo"
        let imageName = "teams"
        return UIImage(named: imageName)
    }
    
    var team: Team! {
        didSet {
            nameLabel.text = team.name
            logoImageView.image = imageForLofo(team.logo!)
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
