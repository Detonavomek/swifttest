import UIKit
import CoreData

//Team information from team list view controller
class TeamCell: UITableViewCell {
    
    //Bind view objects
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoWebView: UIWebView!
    
    //Set name and download image from team logo url and show it at the page using UIWebView
    var team: NSManagedObject! {
        didSet {
            nameLabel.text = String(team.valueForKey("name")!)
            var image=String(team.valueForKey("logo")!)
            if  let url:NSURL = NSURL(string: image){
                if let request: NSURLRequest = NSURLRequest(URL: url){
                    let texttemp = "<img src="+image+" height=\"34\" width=\"34\"/>"
                    logoWebView.loadHTMLString(texttemp, baseURL: url)
                }
            }
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
