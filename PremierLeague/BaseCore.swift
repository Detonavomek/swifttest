import UIKit
import CoreData

import Foundation

class BaseCore {
    
    var appDelegate: AppDelegate
    var managedContext: NSManagedObjectContext
    
    init() {
        self.appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.managedContext = self.appDelegate.managedObjectContext
    }
    
    func changeUpdateDate() {
        let lastUpdateDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let DateInFormat:String = dateFormatter.stringFromDate(lastUpdateDate)
        LeagueData.lastUpdate = DateInFormat
    }
    
    func preSave(entityName: String) -> NSManagedObject {
        let entity =  NSEntityDescription.entityForName(entityName, inManagedObjectContext:self.managedContext)
        let entityObj = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.managedContext)
        return entityObj
    }
    
    func postSave() {
        do {
            try self.managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteEntityObjects(entityName: String) {
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
