//
//  AddResultView.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 10/04/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import UIKit

protocol AddResultViewDelegate {
    func add(value: Int) -> Void
}

@IBDesignable
class AddResultView: NibView {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel! {
        didSet {
            resultLabel.text = "0"
        }
    }
    
    public var delegate: AddResultViewDelegate? = nil
    public var result: Int = 0 {
        didSet {
            resultLabel.text = "\(result)"
        }
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if let delegate = delegate,
            let input = textField.text,
            let value = Int(input) {
            
            delegate.add(value: value)
            
            textField.text = ""
        }
    }
    
    
}
