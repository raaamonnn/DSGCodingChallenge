//
//  CoreUserData.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/13/22.
//

import Foundation
import CoreData
import SwiftUI

class CoreUserData: ObservableObject {
    @Published var favoredEvents: [FavoredEvent]? = nil
    
    init() {
        loadFavoredEvents()
    }
    
    //Deletes an event if it already exists, otherwise adds it
    func editFavoredEvents(eventId: Int) {
        let mainContext = PersistenceController.shared.mainContext
        
        //if it already exists
        if let favoredEvent = favoredEvents?.first(where: { $0.id == eventId }) {
            mainContext.delete(favoredEvent)
        } else {
            let newFavoredEvent = FavoredEvent(context: mainContext)
            newFavoredEvent.id = Int64(eventId)
        }
        do {
            try mainContext.save()
            loadFavoredEvents()
        } catch {
            debugPrint(error)
        }
    }
    
    func contains(favoredEventId: Int) -> Bool {
        return favoredEvents?.contains(where: { $0.id == favoredEventId }) ?? false
    }
    
    func loadFavoredEvents() {
        let mainContext = PersistenceController.shared.mainContext
        let fetchRequest: NSFetchRequest<FavoredEvent> = FavoredEvent.fetchRequest()
        do {
            let results = try mainContext.fetch(fetchRequest)
            self.favoredEvents = results
        }
        catch {
            favoredEvents = [FavoredEvent]()
            debugPrint(error)
        }
    }
}

class PersistenceController {
    static let shared = PersistenceController()
    private init() {}
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserData")
        container.loadPersistentStores(completionHandler: { _, error in
            _ = error.map { fatalError("Unresolved error \($0)") }
        })
        return container
    }()

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func backgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    func save() {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch {
                debugPrint(error)
            }
        }
    }
}
