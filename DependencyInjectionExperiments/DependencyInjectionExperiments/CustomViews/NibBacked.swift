//
//  NibBacked.swift
//  CustomDrawnViews
//
//  Created by Henrik Top Mygind on 13/03/2017.
//  Copyright © 2017 Henrik Top Mygind. All rights reserved.
//

import UIKit

protocol NibBacked: class {
    var bounds: CGRect { get }
    func addSubview(_ view: UIView)
    
    func loadNib()
}

extension NibBacked {
    func loadNib() {
        let view = loadViewFromNib()
        view.frame = bounds
        
        // Auto-layout stuff.
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        
        // Show the view.
        addSubview(view)
    }
    
    private func loadViewFromNib()  -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

class NibView : UIView, NibBacked {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNib()
    }
}
