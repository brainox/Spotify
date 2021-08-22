//
//  ViewController.swift
//  Spotify
//
//  Created by Decagon on 19/08/2021.
//

import UIKit

class TitleBarController: UIViewController {
    
    var musicBarButtonItem: UIBarButtonItem!
    var podCastBarButtonItem: UIBarButtonItem!
    
    // Instantiating the Container that would be the Parent View Controller to children view controllers
    let container = Container()
    
    // Array of view controllers that are to be the Child View Controllers to Container()
    let viewControllers: [UIViewController] = [MusicViewController(), PodcastViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setup()
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItems = [musicBarButtonItem, podCastBarButtonItem]
    }
    
    func setup() {
        guard let containerView = container.view else { return }
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemOrange
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        musicBarButtonItem = makeBarButtonItem(text: "Music", selectior: #selector(musicTapped))
        podCastBarButtonItem = makeBarButtonItem(text: "Podcasts", selectior: #selector(podcastTapped))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBarButtonItem(text: String, selectior: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: selectior, for: .primaryActionTriggered)
        
        let attributes = [
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle).withTraits(traits: [.traitBold]),
            NSAttributedString.Key.foregroundColor: UIColor.label
        ]
        
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        
        button.setAttributedTitle(attributedText, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 16)
        
        
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    
    @objc func musicTapped() {
        // checking if the parent view controller is currently presenting MusicViewController,
        // If it is, return.
        if container.children.first == viewControllers[0] {
            return
        }
        
        // Add to the Parent View Controller
        container.add(viewControllers[0])
        
        // Remove the other one i.e PodcastViewController from the ParentViewController i.e Container()
        viewControllers[1].remove()
    }
    
    @objc func podcastTapped() {
        // checking if the parent view controller is currently presenting PodViewController,
        // If it is, return.
        if container.children.first == viewControllers[1] {
            return
        }
        
        // Add to the ParentView Controller
        container.add(viewControllers[1])
        
        // Remove the other one i.e MusicViewController from the ParentViewController i.e Container()
        viewControllers[0].remove()
    }
}

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)!
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}
