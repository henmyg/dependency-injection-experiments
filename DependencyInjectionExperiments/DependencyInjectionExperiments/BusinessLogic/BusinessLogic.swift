//
//  BusinessLogic.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 10/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import Foundation

class NoDIBusinessLogic {
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
