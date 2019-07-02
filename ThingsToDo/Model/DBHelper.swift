//
//  DBHelper.swift
//  ThingsToDo
//
//  Created by Sunil Gurung on 23/6/19.
//  Copyright © 2019 Sunil Gurung. All rights reserved.
//

import UIKit
import CoreData

class DBHelper {
    var backupObject : [NSManagedObject] = [BackupObject]()
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    func insert(entityName: String, name: String, address: String){
        //let newData = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! BackupObject
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newData = NSManagedObject(entity: entity, insertInto: context)
        newData.setValue(name, forKeyPath: "name")
        newData.setValue(address, forKeyPath: "address")
        do {
            try context.save()
            backupObject.append(newData)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
//    func insert(jsondata : [String : Data],entityName: String){
//        var dataCount = Int()
//        let newData = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
//        do {
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//            let recordData = try context.fetch(request)
//            dataCount = recordData.count + 1
//        } catch {
//            print("Error!")
//        }
//        newData.setValue(dataCount, forKey: "id")
//        newData.setValue("key", forKey: "key")
//        newData.setValue(jsondata["key"], forKey: "value")
//        do {
//            try context.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
     func fetch(entityName: String)-> [BackupObject]{
        var fetchData = [BackupObject]()
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        do {
           try fetchData = (context.fetch(fetchRequest) as? [BackupObject])!

        } catch {
            fatalError("Failed to fetch Data: \(error)")
        }
        return fetchData
    }
    


}
