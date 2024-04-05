//
//  AsyncAwaitAPICalls_ViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-05.
//

import UIKit
import SwiftUI

class AsyncAwaitAPICalls_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        
        let childViewController = UIHostingController(rootView: SwiftAPICallsWithAsyncAwaitView())
        addChild(childViewController)
        view.addSubviews([childViewController.view])
        
        childViewController.view.sizeToSuperview()
    }
}
