//
//  NSManagedObjectContext+Extensions.swift
//  TFCoreData
//
//  Created by Wojciech Nagrodzki on 23/07/2017.
//

import CoreData

extension NSManagedObjectContext {
    
    func refreshObjectsWithoutPersistentChangedValues() {
        let objectsWithoutPersistentChangedValues = updatedObjects.filter { !$0.hasPersistentChangedValues }
        objectsWithoutPersistentChangedValues.forEach { refresh($0, mergeChanges: false) }
    }
}
