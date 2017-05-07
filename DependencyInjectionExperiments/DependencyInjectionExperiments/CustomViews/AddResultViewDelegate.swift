//
//  AddResultViewDelegate.swift
//  DependencyInjectionExperiments
//
//  Created by Henrik Top Mygind on 05/05/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import Foundation

@objc
protocol AddResultViewDelegate {
    func add(value: Int) -> Void
}
