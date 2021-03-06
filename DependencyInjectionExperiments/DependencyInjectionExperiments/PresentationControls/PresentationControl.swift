//
//  PresentationController.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 11/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import Foundation

@objc
protocol AddResultViewProtocol {
    var result: Int { get set }
    var delegate: AddResultViewDelegate? { get set }
}

@IBDesignable
class PresentationControl: NSObject {
    
    var model: BusinessLogic? {
        didSet {
            guard let model = model else { return }
            
            addResultView.result = model.number
        }
    }
    
    @IBOutlet weak var addResultView: AddResultViewProtocol! {
        didSet {
            addResultView.delegate = self
        }
    }
}

extension PresentationControl: AddResultViewDelegate {
    public func add(value: Int) {
        guard let model = model else { return }
        
        addResultView.result = model.addToAndSave(newNumber: value)
    }
}
