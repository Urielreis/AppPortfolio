//
//  ProjectDetailViewController.swift
//  AppProfile
//
//  Created by Uriel on 12/09/24.
//

import UIKit
import AVKit

class ProjectDetailViewController: UIViewController {
    var projectName: String?
    var videoName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground
        
        let titleLabel = UILabel()
        titleLabel.text = projectName
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor.systemTeal
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let playButton = UIButton(type: .system)
        playButton.setTitle("Assistir Vídeo", for: .normal)
        playButton.tintColor = .white
        playButton.backgroundColor = UIColor.systemPurple
        playButton.layer.cornerRadius = 10
        playButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 200),
            playButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func playVideo() {
        guard let videoName = videoName else { return }
        guard let videoPath = Bundle.main.path(forResource: videoName, ofType: "mp4") else { return }
        let videoURL = URL(fileURLWithPath: videoPath)
        
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
    }
}
