//
//  NoDIViewController.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 10/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import UIKit

class NoDIViewController: UIViewController {

    @IBOutlet weak var addResultView: AddResultView!
    
    var model: NoDIBusinessLogic = NoDIBusinessLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addResultView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addResultView.result = model.number
    }
}

extension NoDIViewController: AddResultViewDelegate {
    public func add(value: Int) {
        addResultView.result = model.addToAndSave(newNumber: value)
    }
}
