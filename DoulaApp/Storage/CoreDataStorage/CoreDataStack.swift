//
//  CoreDataStack.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import Foundation
import CoreData



public final class CoreDataStack{
    
    private init(){}
    
    public static var shared = CoreDataStack()
    
    lazy var persistentContainer:NSPersistentContainer = {
        let contatiner = NSPersistentContainer(name: "DoulaApp")
        contatiner.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError?{
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
           
        })
        return contatiner
    }()
    
    public lazy var viewContext:NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
    }
    
    
}
