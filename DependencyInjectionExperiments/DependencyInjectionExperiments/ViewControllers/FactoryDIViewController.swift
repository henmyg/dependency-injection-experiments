//
//  FactoryDIViewController.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 11/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import UIKit

class FactoryDIViewController: UIViewController {
    @IBOutlet weak var addResultView: AddResultView!
    
    var model: BusinessLogic = Factory.sharedInstance.businessLogic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addResultView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addResultView.result = model.number
    }
}

extension FactoryDIViewController: AddResultViewDelegate {
    public func add(value: Int) {
        addResultView.result = model.addToAndSave(newNumber: value)
    }
}
