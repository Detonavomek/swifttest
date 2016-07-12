import UIKit
import CoreData

import Foundation

//Base class work with CoreData
class BaseCore {
    
    var appDelegate: AppDelegate
    var managedContext: NSManagedObjectContext
    
    init() {
        //Init context
        self.appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.managedContext = self.appDelegate.managedObjectContext
    }
    
    static func changeUpdateDate() {
        //Set last update datetime to current datetime
        let lastUpdateDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let DateInFormat:String = dateFormatter.stringFromDate(lastUpdateDate)
        LeagueData.lastUpdate = DateInFormat
    }
    
    func preSave(entityName: String) -> NSManagedObject {
        //Get entity object for entityName
        let entity =  NSEntityDescription.entityForName(entityName, inManagedObjectContext:self.managedContext)
        let entityObj = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.managedContext)
        return entityObj
    }
    
    func postSave() {
        //Save all changes using context
        do {
            try self.managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteEntityObjects(entityName: String) {
        //Delete all objects by entity name
        let coord = self.appDelegate.persistentStoreCoordinator
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coord.executeRequest(deleteRequest, withContext: self.managedContext)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
}
