//
//  ProgressBarSwiftUIView.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-05.
//
//  Reference: https://www.youtube.com/watch?v=8pMx1rmU5Ig
//  SwiftUI ProgressBar

import SwiftUI
import Combine

struct ProgressBar: View {
    // Step 3: Move these to ViewModel
//    @State private var containerWidth: CGFloat = 0
//    @State private var progressTitle: String = "progressTitle"
//    @State private var progress: Int = 0
    @ObservedObject var viewModel: ProgressBarSwiftUIViewModel
    
    // Step 2.2.1: Adding Combine subscription
    var startSub = PassthroughSubject<Void, Never>()
    
    var maxWidth: Double {
        return min(Double(viewModel.progress), viewModel.containerWidth)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(.clear)
                        .onAppear {
                            viewModel.containerWidth = geo.size.width
                        }
                }
                RoundedRectangle(cornerRadius: 60)
//                    .stroke(Color("BorderColor"), lineWidth: 1)
                    .stroke(.black, lineWidth: 1)
                
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 60)
//                        .fill(Color("ProgressColor"))
                        .fill(.orange)
                    
                    Text("\(viewModel.progressTitle)")
                        .monospaced()
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                        .background(
                            RoundedRectangle(cornerRadius: 60)
//                                .fill(Color("CircleColor"))
                                .fill(.red)
                        )
                }
                .padding(2)
                .frame(minWidth: maxWidth)
                .fixedSize()
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(20)
            .onAppear {
                viewModel.progressTitle = "\(viewModel.progress)"
            }
            
            // Step 2: Removing Button here and adding in ViewController
            // Old form of starting -> Was refactored into ViewController
//            Button("Start") {
//                start()
//            }
////            .tint(Color("CircleColor"))
//            .tint(.red)
        }
        // Step 2.2.2: Adding Combine subscription
        .onReceive(startSub) {
            start()
        }
    }
    
    func start() {
        print("containerWidth: \(viewModel.containerWidth)")
        viewModel.progress = 0
        
        Task {
            for i in 1 ... 100 {
                try await Task.sleep(until: .now.advanced(by: .milliseconds(30)), clock: .continuous)
                viewModel.progressTitle = "\(i)%"
                withAnimation {
                    viewModel.progress = Int(Double(viewModel.containerWidth) / 100 * Double(i))
                }
            }
        }
    }
}

#Preview {
    ProgressBar(viewModel: ProgressBarSwiftUIViewModel())
}
