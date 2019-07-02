//
//  BackupObject.swift
//  ThingsToDo
//
//  Created by Sunil Gurung on 23/6/19.
//  Copyright © 2019 Sunil Gurung. All rights reserved.
//

import UIKit
import CoreData

@objc(UserEntity)
class BackupObject: NSManagedObject{
    //@NSManaged var id : Int?
    @NSManaged dynamic var name: String?
    @NSManaged dynamic var address: String?
}
