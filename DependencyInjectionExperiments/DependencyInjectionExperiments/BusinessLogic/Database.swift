//
//  Database.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 11/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import Foundation

class UserDefaultsDatabase: Database {
    func integer(forKey key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    func set(integer: Int, forKey key: String) -> Void {
        UserDefaults.standard.setValue(integer, forKey: key)
    }
}
