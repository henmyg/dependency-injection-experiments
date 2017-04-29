//
//  ViewModelViewController.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 11/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import UIKit

class PresentationControlViewControl: UIViewController {
    
    @IBOutlet var presentationControl: PresentationControl!
    
    override func viewDidLoad() {
        presentationControl.model = Factory.sharedInstance.businessLogic
    }

}
