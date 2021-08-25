//
//  CoreDataStore.swift
//  core-data-api
//
//  Created by GMV on 24/08/21.
//

import Foundation
import CoreData

class CoreDataStore {
    class var shared: CoreDataStore {
        struct Singleton {
            static let instance = CoreDataStore()
        }
        return Singleton.instance
    }
    
    private init(){}
    
    var context: NSManagedObjectContext {
        return CoreDataStore.shared.persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext  {
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.persistentStoreCoordinator = context.persistentStoreCoordinator
        return privateContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "core_data_api")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext(){
        let context = CoreDataStore.shared.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                fatalError("Save context error \(error.localizedDescription)")
            }
        }
    }
}
