//
//  PresentationControlTests.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 05/05/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import XCTest
import UIKit

class BusinessLogicMock: BusinessLogic {
    var number: Int = -14
    
    var lastNewNumber: Int = 0
    var intToReturn: Int = 0
    
    func addToAndSave(newNumber new: Int) -> Int {
        lastNewNumber = new
        return intToReturn
    }
}

class AddResultViewMock: AddResultViewProtocol {
    var result: Int = 0
    var delegate: AddResultViewDelegate? = nil
}

class PresentationControlTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThat_ViewIsInitialised_WhenModelIsSet() {
        // ARRANGE
        let sut = PresentationControl()
        let model = BusinessLogicMock()
        
        let view = AddResultViewMock()
        sut.addResultView = view
        
        model.number = 82
        
        // ACT
        sut.model = model
        
        // ASSERT
        XCTAssertEqual(82, view.result)
    }
    
    func testThat_ModelIsUpdatedWithNewNumber_WhenAddIsCalled() {
        // ARRANGE
        let sut = PresentationControl()
        
        let view = AddResultViewMock()
        sut.addResultView = view
        
        let model = BusinessLogicMock()
        sut.model = model
        
        // ACT
        sut.add(value: -28)
        
        // ASSERT
        XCTAssertEqual(-28, model.lastNewNumber)
    }
    
    func testThat_ViewIsUpdatedWithLatestResults_WhenAddIsCalled() {
        // ARRANGE
        let sut = PresentationControl()
        
        let view = AddResultViewMock()
        sut.addResultView = view
        
        let model = BusinessLogicMock()
        sut.model = model
        
        model.intToReturn = -12
        
        // ACT
        sut.add(value: 27)
        
        // ASSERT
        XCTAssertEqual(-12, view.result)
    }
}
