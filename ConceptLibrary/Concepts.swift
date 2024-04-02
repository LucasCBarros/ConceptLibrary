//
//  Concepts.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-03-25.
//

import UIKit

enum Concepts: String, CaseIterable {
    case first
    case second
    case LayoutIfNeeded
    
    func Type() -> UIViewController {
        switch self {
        case .first:
            let vc = ConceptsListViewController()
            vc.view.backgroundColor = .brown
            return vc
        case .second:
            let vc = ConceptsListViewController()
            vc.view.backgroundColor = .blue
            return vc
        case .LayoutIfNeeded:
            return LayoutIfNeeded_ViewController()
        }
    }
    
    func Description() -> String {
        switch self {
        case .first:
            return "first VC description"
        case .second:
            return "second VC description"
        case .LayoutIfNeeded:
            return "Reason behind needing to call LayoutIfNeeded "
        }
    }
}
