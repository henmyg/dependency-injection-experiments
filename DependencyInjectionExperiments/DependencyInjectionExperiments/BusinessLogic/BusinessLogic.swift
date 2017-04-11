//
//  BusinessLogic.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 10/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import Foundation

protocol Database {
    func integer(forKey key: String) -> Int
    func set(integer: Int, forKey key: String) -> Void
}

protocol BusinessLogic {
    var number: Int { get }
    func addToAndSave(newNumber new: Int) -> Int
}

class NoDIBusinessLogic: BusinessLogic {
    private let userDefaultsKey = "NoDINumberKey"
    
    public var number: Int {
        return UserDefaults.standard.integer(forKey: userDefaultsKey)
    }
    
    public func addToAndSave(newNumber new: Int) -> Int {
        let old = UserDefaults.standard.integer(forKey: userDefaultsKey)
        let result = old + new
        UserDefaults.standard.setValue(result, forKey: userDefaultsKey)
        
        return result
    }
}

class DIBusinessLogic: BusinessLogic {
    
    private let userDefaultsKey = "NoDINumberKey"
    private let database: Database
    
    init(database: Database) {
        self.database = database
    }
    
    public var number: Int {
        return self.database.integer(forKey: userDefaultsKey)
    }
    
    public func addToAndSave(newNumber new: Int) -> Int {
        let old = self.database.integer(forKey: userDefaultsKey)
        let result = old + new
        self.database.set(integer: result, forKey: userDefaultsKey)
        
        return result
    }
}
