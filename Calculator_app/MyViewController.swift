//
//  MyViewController.swift
//  Calculator_app
//
//  Created by Dushyanth Challagundla on 3/4/24.
//

import UIKit

class MyViewController: UIViewController {
    let subview1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add subview1 to the main view
        self.view.addSubview(subview1)
        
        // Create and add centerXconstraint
        let centerXconstraint = NSLayoutConstraint(item: subview1, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 2.0)
        let centerYconstraint = NSLayoutConstraint(item: subview1, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 2.0)
    }
}
