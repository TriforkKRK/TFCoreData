//
//  NotificationWrappers.swift
//  TFCoreData
//
//  Created by Wojciech Nagrodzki on 19/07/2017.
//

import CoreData

extension Notification {
    
    public struct ManagedObjectContextObjectsDidChange {

        public var insertedObjects: Set<NSManagedObject> { return notification.objects(for: NSInsertedObjectsKey) }
        public var updatedObjects: Set<NSManagedObject> { return notification.objects(for: NSUpdatedObjectsKey) }
        public var deletedObjects: Set<NSManagedObject> { return notification.objects(for: NSDeletedObjectsKey) }
        public var refreshedObjects: Set<NSManagedObject> { return notification.objects(for: NSRefreshedObjectsKey) }
        public var invalidatedObjects: Set<NSManagedObject> { return notification.objects(for: NSInvalidatedObjectsKey) }
        private let notification: Notification
        
        fileprivate init(notification: Notification) {
            precondition(notification.name == .NSManagedObjectContextObjectsDidChange)
            self.notification = notification
        }
    }
    
    public func asManagedObjectContextObjectsDidChange() -> ManagedObjectContextObjectsDidChange {
        return ManagedObjectContextObjectsDidChange(notification: self)
    }
}

extension Notification {
    
    public struct ManagedObjectContextDidSave {
        
        public var insertedObjects: Set<NSManagedObject> { return notification.objects(for: NSInsertedObjectsKey) }
        public var updatedObjects: Set<NSManagedObject> { return notification.objects(for: NSUpdatedObjectsKey) }
        public var deletedObjects: Set<NSManagedObject> { return notification.objects(for: NSDeletedObjectsKey) }
        private let notification: Notification
        
        fileprivate init(notification: Notification) {
            precondition(notification.name == .NSManagedObjectContextDidSave)
            self.notification = notification
        }
    }
    
    public func asManagedObjectContextDidSave() -> ManagedObjectContextDidSave {
        return ManagedObjectContextDidSave(notification: self)
    }
}

extension Notification {
    fileprivate func objects(for key: String) -> Set<NSManagedObject> {
        return userInfo?[key] as! Set<NSManagedObject>? ?? []
    }
}
