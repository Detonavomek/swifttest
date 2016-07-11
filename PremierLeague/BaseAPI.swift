import Foundation

class BaseAPI
{
    
    var urlPath: String
    var url: NSURL
    var request: NSURLRequest
    var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>
    var responseObj: [String: AnyObject]
    
    init(urlPath:String){
        self.urlPath = urlPath
        self.url = NSURL(string: urlPath)!
        self.request = NSURLRequest(URL: url)
        self.response=nil
        self.responseObj = [:];
    }
    
    func Req(){
        do{
            let dataVal = try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
            if let jsonResult = try NSJSONSerialization.JSONObjectWithData(dataVal, options: []) as? NSDictionary {
                self.responseObj = (jsonResult as? [String: AnyObject])!
            }
        }catch let error as ErrorType{
            print(error)
        }
    }
}
