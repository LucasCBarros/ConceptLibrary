//
//  Text2Speech_ViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-18.
//
// Ref: https://www.youtube.com/watch?v=qDrNDbCWss4

import UIKit
import AVKit

class Text2Speech_ViewController: UIViewController {
    
    // MARK: UI Components
    private let textInputField = UITextField()
    private let startSpeechButton = UIButton()
    
    // MARK: Variables
    var synthesizer = AVSpeechSynthesizer()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    @objc private func clickStartSpeech() {
        let utterance = AVSpeechUtterance(string: textInputField.text ?? "Error")
        
        utterance.rate = 0.5
        utterance.volume = 1
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
}

// MARK: - Setup UI
extension Text2Speech_ViewController: ViewCodable {
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
        startSpeechButton.addTarget(self, action: #selector(clickStartSpeech), for: .touchUpInside)
        startSpeechButton.backgroundColor = .red
    }
}
