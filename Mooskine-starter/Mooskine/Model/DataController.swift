//
//  DataController.swift
//  Mooskine
//
//  Created by YoYo on 2021-06-29.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    let persistenseContainer:NSPersistentContainer
    
    var viewContext: NSManagedObjectContext{
        return persistenseContainer.viewContext
    }
    init(modelName: String){
        persistenseContainer = NSPersistentContainer(name: modelName)
    }
    func load(completion: (() -> Void)? = nil){
        persistenseContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else{
                fatalError(error!.localizedDescription)
            }
        }
        self.autoSaveViewContext(interval: 3)
        completion?()
    }
    
}

extension DataController{
    func autoSaveViewContext(interval: TimeInterval = 30){
        print("autosaving")
        guard interval > 0 else{
            print("cannot have negative intervals")
            return
        }
        if viewContext.hasChanges{
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}
