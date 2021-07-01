//
//  UpdateToAttributedStringsPolicy.swift
//  Mooskine
//
//  Created by YoYo on 2021-07-01.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UpdateToAttributesStringsPolicy: NSEntityMigrationPolicy{
    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        try super.createDestinationInstances(forSource: sInstance, in: mapping, manager: manager)
        
        guard let destination = manager.destinationInstances(forEntityMappingName: mapping.name, sourceInstances: [sInstance]).first else {return}
        
        if let text = sInstance.value(forKey: "text") as? String{
            destination.setValue(NSAttributedString(string: text), forKey: "attributedText")
        }
    }
}
