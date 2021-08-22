//
//  Extensions.swift
//  Spotify
//
//  Created by Decagon on 22/08/2021.
//

import UIKit

// MARK: - Adding and Removing a Child View controller

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

