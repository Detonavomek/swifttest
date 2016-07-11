//
//  TeamCell.swift
//  PremierLeague
//
//  Created by anton on 7/11/16.
//  Copyright © 2016 organization. All rights reserved.
//

import UIKit
import CoreData

class TeamCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    func imageForLofo(logo:String) -> UIImage? {
        let imageName = "teams"
        return UIImage(named: imageName)
    }
    
    var team: NSManagedObject! {
        didSet {
            nameLabel.text = String(team.valueForKey("name")!)
            logoImageView.image = imageForLofo(String(team.valueForKey("logo")!))
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
