//
//  LayoutIfNeeded_ViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-03-26.
//

import UIKit

class LayoutIfNeeded_ViewController: UIViewController {
    
    // MARK: UI Components
    private let MintView = UIView()
    private let addHeightButton = UIButton()
    
    // MARK: Variables
    private var colorViewHeight = NSLayoutConstraint()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    @objc private func increaseSquareHeight() {
        // MARK: Rational & Explanation
        /// Issue: We can see that the height of the MintView doesn't change when printing
        /// However on the aplication we see that the height is being increased
        ///
        /// Reason: The code doesn't directly update the FRAME of the MintView, it updates the CONSTRAINT of the MintView
        /// that will update the FRAME when the views are laid out again.
        /// This will happen automatically after the tap event has been processed, that's why we don't see an immediate update in code.
        ///
        /// Rational for this default behaviour:
        /// This is smart because waiting for user interaction to be processed before laying out the views minimize the number of times layout needs to happen.
        ///
        /// Fix: However if your code need the geometry of the views to run correctly, you can call LayoutIfNeeded manually on the parent view.
        
        // MARK: Example 01 - Why it doesn't change immediately
        print("Debug 01 >>> ", MintView.frame.height) // 100
        self.colorViewHeight.constant += 25
        print("Debug 02 >>> ", MintView.frame.height) // 100
        
        // After calling the method we can see that it has been updated
        view.layoutIfNeeded()
        print("Debug 03 >>> ", MintView.frame.height) // 125
        
        // MARK: Example 02 - How it affects animations
//        UIView.animate(withDuration: 0.3) {
//            // Even thought the change is inside an animation closure, no animation will happen.
//            // Because an animation closure will animate any change to animatable properties made inside it
//            // However we seen that regardless if we update the constraint within the closure, the frame will be updated later after the closure has returned
//            self.colorViewHeight.constant += 25
//            
//            // To make the animation happen we need to call LayoutIfNeeded
//            self.view.layoutIfNeeded()
//        }
        
        // MARK: Example 03 - Better animation
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
//            self.colorViewHeight.constant += 25
//
//            // To make the animation happen you need to call LayoutIfNeeded
//            self.view.layoutIfNeeded()
//        }, completion: nil)
    }
}

// MARK: - Setup UI
extension LayoutIfNeeded_ViewController: ViewCodable {
    func addHierarchy() {
        self.view.addSubviews([MintView,
                               addHeightButton])
    }
    
    func addConstraints() {
        addHeightButton
            .centerHorizontalToSuperView()
            .bottomToSuperview(100)
            .heightTo(100)
            .widthTo(200)
        
        MintView
            .centerHorizontalToSuperView()
            .bottomToTop(of: addHeightButton, margin: 50)
            .widthTo(200)
    }
    
    func additionalConfig() {
        self.navigationItem.title = "LayoutIfNeeded()"
        
        colorViewHeight = MintView.heightAnchor.constraint(equalToConstant: 100)
        colorViewHeight.isActive = true
        
        MintView.backgroundColor = .systemMint
        MintView.layer.cornerRadius = 10
        MintView.layer.masksToBounds = true
        
        addHeightButton.setTitle("+25 Height", for: .normal)
        addHeightButton.addTarget(self, action: #selector(increaseSquareHeight), for: .touchUpInside)
        addHeightButton.backgroundColor = .systemMint
    }
}


// MARK: - References used:
/// Vincent Pradeilles - Explanation
/// https://www.linkedin.com/posts/vincentpradeilles_viewlayoutifneeded-im-sure-that-ugcPost-7176921589131714560-DPPe/
///
/// Programmatic animation with height constraint
/// https://stackoverflow.com/questions/43010173/how-to-programmatically-increase-the-height-of-uiview-with-swift
