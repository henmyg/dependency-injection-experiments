//
//  Factory.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 11/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import Foundation

class Factory {
    
    static let sharedInstance: Factory = Factory()
    
    let database: Database
    let businessLogic: BusinessLogic
    
    private init() {
        database = UserDefaultsDatabase()
        businessLogic = DIBusinessLogic(database: database)
    }
}
