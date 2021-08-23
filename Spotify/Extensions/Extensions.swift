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

// Spotify Colors
extension UIColor {
    static let spotifyGreen = UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1.0)
    static let spotifyBlack = UIColor(red: 12/255, green: 12/255, blue: 12/255, alpha: 1.0)
}

// Function to make NavBarButton
func makeButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    
    return button
}

