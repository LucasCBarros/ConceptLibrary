//
//  Concepts.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-03-25.
//

import UIKit

enum Concepts: String, CaseIterable {
    case UIKitWithSwiftUI
    case AsyncAwaitAPICalls
    case LayoutIfNeeded
    
    var title: String {
        switch self {
        case .UIKitWithSwiftUI:
            return "UIKit with SwiftUI"
        case .AsyncAwaitAPICalls:
            return "Async Await API calls"
        case .LayoutIfNeeded:
            return "LayoutIfNeeded explained"
        }
    }
    
    var description: String {
        switch self {
        case .UIKitWithSwiftUI:
            return "Programmatic UIKit viewController With SwiftUI integration"
        case .AsyncAwaitAPICalls:
            return "Async Await API calls with Github endpoint"
        case .LayoutIfNeeded:
            return "Reason behind needing to call LayoutIfNeeded "
        }
    }
    
    func ViewController() -> UIViewController {
        switch self {
        case .UIKitWithSwiftUI:
            return UIKitWithSwiftUI_ViewController()
        case .AsyncAwaitAPICalls:
            return AsyncAwaitAPICalls_ViewController()
        case .LayoutIfNeeded:
            return LayoutIfNeeded_ViewController()
        }
    }
    
//    func Description() -> String {
//        switch self {
//        case .UIKitWithSwiftUI:
//            return "Programmatic UIKit viewController With SwiftUI integration"
//        case .AsyncAwaitAPICalls:
//            return "Async Await API calls with Github endpoint"
//        case .LayoutIfNeeded:
//            return "Reason behind needing to call LayoutIfNeeded "
//        }
//    }
}
