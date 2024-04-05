//
//  ProgressBarSwiftUIViewModel.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-05.
//

import Foundation

// Step 3: Adding ViewModel
class ProgressBarSwiftUIViewModel: ObservableObject {
    @Published var containerWidth: CGFloat = 0
    @Published var progressTitle: String = "progressTitle"
    @Published var progress: Int = 0
}
