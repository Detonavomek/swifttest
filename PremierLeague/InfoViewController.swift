import UIKit
import CoreData

//Team details view controller
class InfoViewController: UIViewController {

    //Bind view objects
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var logoWebView: UIWebView!

    //Create team object
    var team:NSManagedObject!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Show name and history from team object
        nameLabel.text = String(team.valueForKey("name")!)
        historyLabel.text = String(team.valueForKey("history")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Download image from team logo url and show it at the page using UIWebView
        var image=String(team.valueForKey("logo")!)
        if  let url:NSURL = NSURL(string: image){
            if let request: NSURLRequest = NSURLRequest(URL: url){
                let texttemp = "<img src="+image+" height=\"110\" width=\"110\"/>"
                logoWebView.loadHTMLString(texttemp, baseURL: url)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
