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
    case GenericTableView
    case Text2Speech
    case VoiceRecognition
    
    var title: String {
        switch self {
        case .UIKitWithSwiftUI:
            return "UIKit with SwiftUI"
        case .AsyncAwaitAPICalls:
            return "Async Await API calls"
        case .LayoutIfNeeded:
            return "LayoutIfNeeded explained"
        case .GenericTableView:
            return "GenericTableView"
        case .Text2Speech:
            return "Text to Speech"
        case .VoiceRecognition:
            return "Voice Recognition"
        }
    }
    
    var description: String {
        switch self {
        case .UIKitWithSwiftUI:
            return "Programmatic UIKit viewController With SwiftUI integration"
        case .AsyncAwaitAPICalls:
            return "Async Await API calls with Github endpoint"
        case .LayoutIfNeeded:
            return "Reason behind needing to call LayoutIfNeeded"
        case .GenericTableView:
            return "GenericTableView"
        case .Text2Speech:
            return "Text to Speech with a button"
        case .VoiceRecognition:
            return "Voice Recognition"
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
        case .GenericTableView:
            return EmbeddedViewControllerWithCollectionView_ViewController()
        case .Text2Speech:
            return Text2Speech_ViewController()
        case .VoiceRecognition:
            return VoiceRecognition_ViewController()
        }
    }
}

enum Sections: String, CaseIterable {
    case UIConcepts
    case DesignPattern
}
