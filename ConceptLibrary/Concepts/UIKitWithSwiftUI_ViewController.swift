//
//  UIKitWithSwiftUI_ViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-05.
//

import Foundation

import UIKit
import SwiftUI

class UIKitWithSwiftUI_ViewController: UIViewController {
    
    // Step 1: Adding SwiftUI into ViewController
//    let childVC = UIHostingController(rootView: ProgressBar())
    
    //Step 3: Now it can use the ViewModel
    let childVC = UIHostingController(rootView: ProgressBar(viewModel: ProgressBarSwiftUIViewModel()))
    // UIHostingController is the way to integrate SwiftUI into UIKit

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBlue
        
        // Step 1.1
        addChild(childVC)
        view.addSubviews([childVC.view])
        
//        childVC.view.sizeToSuperview()
        
        // Step 2: Add button to work in ViewController
        let button = UIButton(configuration: .plain())
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(start), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [childVC.view, button])
        stackView.axis = .vertical
        view.addSubviews([stackView])
        
        stackView
            .leadingToSuperview()
            .trailingToSuperview()
            .centerVerticalToSuperView()
    }

    
    @objc func start() {
        // Step 2.1: Adding button action in the ViewController - But doesn't work
        print("Started!")
        // Won't work because the containerWidth will be zero
        childVC.rootView.start()
        
        // Step 2.2: Adding Combine to make it work
        // Works with Combine PassthroughSubject
//        childVC.rootView.startSub.send()
        
        // Step 3: Now it can just get from the ViewModel directly
        childVC.rootView.start()
    }
}
