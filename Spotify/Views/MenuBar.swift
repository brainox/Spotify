//
//  MenuBar.swift
//  Spotify
//
//  Created by Decagon on 22/08/2021.
//

import Foundation
import UIKit

protocol MenuBarDelegate: AnyObject {
    func didSelectItemAt(index: Int)
}

class MenuBar: UIView {
    
    let playlistsButton: UIButton!
    let artistsButton: UIButton!
    let albumsButton: UIButton!
    var buttons: [UIButton]!
    
    weak var delegate: MenuBarDelegate?
     
    override init(frame: CGRect) {
        playlistsButton = makeButton(withText: "Playlists")
        artistsButton = makeButton(withText: "Artists")
        albumsButton = makeButton(withText: "Albums")

        buttons = [playlistsButton, artistsButton, albumsButton]
        
        super.init(frame: .zero)
        
        playlistsButton.addTarget(self, action: #selector(playListsButtonTapped), for: .primaryActionTriggered)
        artistsButton.addTarget(self, action: #selector(artistsButtonTapped), for: .primaryActionTriggered)
        albumsButton.addTarget(self, action: #selector(albumsButtonTapped), for: .primaryActionTriggered)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
         addSubview(playlistsButton)
        addSubview(artistsButton)
        addSubview(albumsButton)
        
        NSLayoutConstraint.activate([
            playlistsButton.topAnchor.constraint(equalTo: topAnchor),
            playlistsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            artistsButton.topAnchor.constraint(equalTo: topAnchor),
            artistsButton.leadingAnchor.constraint(equalTo: playlistsButton.trailingAnchor, constant: 36),
            albumsButton.topAnchor.constraint(equalTo: topAnchor),
            albumsButton.leadingAnchor.constraint(equalTo: artistsButton.trailingAnchor, constant: 36)
            
        ])
    }
}

extension MenuBar {
    @objc func playListsButtonTapped() {
        delegate?.didSelectItemAt(index: 0)
    }
    
    @objc func artistsButtonTapped() {
        delegate?.didSelectItemAt(index: 1)
    }
    
    @objc func albumsButtonTapped() {
        delegate?.didSelectItemAt(index: 2)
    }
}
