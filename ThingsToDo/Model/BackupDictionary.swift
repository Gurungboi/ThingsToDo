//
//  BackupDictionary.swift
//  ThingsToDo
//
//  Created by Sunil Gurung on 30/6/19.
//  Copyright © 2019 Sunil Gurung. All rights reserved.
//

import Foundation
import UIKit

class BackupDicitonary {
    func insertDataIntoTableAsDictionary(entityName: String, result: NSArray) {
        var dataresult = [String: Data]()
        let data: Data = NSKeyedArchiver.archivedData(withRootObject: result)
        dataresult["key"] = data
        //DBHelper().insert(jsondata: dataresult, entityName: entityName)
    }
    
    
}
