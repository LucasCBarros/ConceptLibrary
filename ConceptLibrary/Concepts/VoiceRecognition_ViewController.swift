//
//  VoiceRecognition_ViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-18.
//
// Ref: https://www.youtube.com/watch?v=nS4s4xCsaWc

import UIKit
import InstantSearchVoiceOverlay

class VoiceRecognition_ViewController: UIViewController {
    
    // MARK: UI Components
    private let textInputField = UITextField()
    private let startSpeechButton = UIButton()
    
    // MARK: Variables
    let voiceOverlayController = VoiceOverlayController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    @objc private func clickStartRecording() {
        voiceOverlayController.start(on: self, textHandler: { text, final, _ in
            if final {
                print("Final text: \(text)")
                self.textInputField.text = text
            } else {
                print("In progress: \(text)")
                self.textInputField.text = text
            }
        }, errorHandler: { error in
            
        })
    }
}

// MARK: - Setup UI
extension VoiceRecognition_ViewController: ViewCodable {
    func addHierarchy() {
        self.view.addSubviews([textInputField,
                               startSpeechButton])
    }
    
    func addConstraints() {
        startSpeechButton
            .topToBottom(of: textInputField, margin: 20)
            .centerHorizontalToSuperView()
            .widthTo(200)
        
        textInputField
            .topToSuperview(150)
            .widthToSuperview(-50)
            .heightTo(100)
            .centerHorizontalToSuperView()
    }
    
    func additionalConfig() {
        self.navigationItem.title = "Text To Speech"
        
        textInputField.text = "Hello testing, is this speech working?"
        textInputField.textColor = .black
        textInputField.backgroundColor = .white
        
        startSpeechButton.setTitle("Start Speech", for: .normal)
        startSpeechButton.addTarget(self, action: #selector(clickStartRecording), for: .touchUpInside)
        startSpeechButton.backgroundColor = .red
    }
}
