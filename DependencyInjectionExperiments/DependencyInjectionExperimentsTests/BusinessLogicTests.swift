//
//  BusinessLogicTests.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 29/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import XCTest

class DatabaseMock: Database {
    var lastGetKey: String = ""
    var integerToReturn = 42
    
    var lastSetKey: String = ""
    var lastSetInteger: Int = 42
    
    func integer(forKey key: String) -> Int {
        lastGetKey = key
        return integerToReturn
    }
    func set(integer: Int, forKey key: String) -> Void {
        lastSetKey = key
        lastSetInteger = integer
    }
}

class BusinessLogicTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThat_addToAndSave_callsDatabaseWithTheSumOfNewAndOldNumber() {
        // ARRANGE
        let database = DatabaseMock()
        database.integerToReturn = 12
        let sut = DIBusinessLogic(database: database)
        
        // ACT
        sut.addToAndSave(newNumber: 8)
        
        // ASSERT
        XCTAssertEqual(8 + 12, database.lastSetInteger)
    }
    
    func testThat_addToAndSave_returnsTheSumOfNewAndOldNumber() {
        // ARRANGE
        let database = DatabaseMock()
        database.integerToReturn = 12
        let sut = DIBusinessLogic(database: database)
        
        // ACT
        let result = sut.addToAndSave(newNumber: 37)
        
        // ASSERT
        XCTAssertEqual(12 + 37, result)
    }
    
    func testThat_number_returnsIntegerFromDatabase() {
        // ARRANGE
        let database = DatabaseMock()
        database.integerToReturn = 77
        let sut = DIBusinessLogic(database: database)
        
        // ACT
        let result = sut.number
        
        // ASSERT
        XCTAssertEqual(77, result)
    }
}
