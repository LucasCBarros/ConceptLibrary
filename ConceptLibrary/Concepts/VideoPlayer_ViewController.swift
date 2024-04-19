//
//  VideoPlayer_ViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-18.
//
// Ref1: https://www.youtube.com/watch?v=MlWodvLtYHc
// Ref2: https://www.youtube.com/watch?v=RGbmhS1r6gw

import AVFoundation
import AVKit
import UIKit

class VideoPlayer_ViewController: UIViewController, AVPlayerViewControllerDelegate {
    
    // MARK: UI Components
    private let videoView = UIView()
    private let startSpeechButton = UIButton()
    
    // MARK: Variables
    var player = AVPlayer()
    var avPlayerController = AVPlayerViewController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        startVideo()
    }
    
    func startVideo() {
        guard let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726") else { return }
        
//        guard let url = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4") else { return }
        
        avPlayerController = AVPlayerViewController()
        
        player = AVPlayer(url: url)
        avPlayerController.player = player
        
        avPlayerController.allowsPictureInPicturePlayback = true
        avPlayerController.delegate = self
        
        avPlayerController.view.frame.size.height = videoView.frame.size.height
        avPlayerController.view.frame.size.width = videoView.frame.size.width
        self.videoView.addSubview(avPlayerController.view)
        
        // MARK: Option 1 - Runs the video in the view at current ViewController
        player.play()
        
        // MARK: Option 2 - Creates a overlayed ViewController for the video
//        avPlayerController.player?.play()
//        self.present(avPlayerController, animated: true)
        
        
        // Will get the error:
        // "The resource could not be loaded because the App Transport Security policy requires the use of a secure connection."
        // Needs to add NSTransportSecurity to info.plist > Allow Arbitraty loads
        
    }
}

// MARK: - Setup UI
extension VideoPlayer_ViewController: ViewCodable {
    func addHierarchy() {
        self.view.addSubviews([videoView,
                               startSpeechButton])
    }
    
    func addConstraints() {
        startSpeechButton
            .topToBottom(of: videoView, margin: 20)
            .centerHorizontalToSuperView()
            .widthTo(200)
        
        videoView
            .topToSuperview(150)
            .widthToSuperview()
            .heightTo(200)
            .centerHorizontalToSuperView()
    }
    
    func additionalConfig() {
        self.navigationItem.title = "Text To Speech"
        
        videoView.backgroundColor = .systemMint
        
        startSpeechButton.setTitle("Start Speech", for: .normal)
        startSpeechButton.backgroundColor = .red
    }
}

