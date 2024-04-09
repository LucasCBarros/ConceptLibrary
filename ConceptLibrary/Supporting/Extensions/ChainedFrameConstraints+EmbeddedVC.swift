//
//  ChainedFrameConstraints+EmbeddedVC.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-09.
//

import UIKit

extension UIView {
    @discardableResult
    func frameTopToBottom(of view: UIView, toSafeArea: Bool = true) -> UIView {
        self.frame = CGRect(x: self.frame.origin.x,
                            y: view.frame.height + view.frame.origin.y,
                            width: self.frame.width,
                            height: self.frame.height)
        return self
    }
    
    @discardableResult
    func frameWidthToSuper(of view: UIView) -> UIView {
        self.frame = CGRect(x: self.frame.origin.x,
                            y: self.frame.origin.y,
                            width: view.frame.width,
                            height: self.frame.height)
        return self
    }
    
    @discardableResult
    func frameCenterToSuper(of view: UIView) -> UIView {
        self.frame = CGRect(x: view.frame.width/2-self.frame.width/2,
                            y: view.frame.height/2-self.frame.height/2,
                            width: self.frame.width,
                            height: self.frame.height)
        return self
    }
    
    @discardableResult
    func frameCenterHorizontalToSuper(of view: UIView) -> UIView {
        self.frame = CGRect(x: view.frame.width/2-self.frame.width/2,
                            y: self.frame.origin.y,
                            width: self.frame.width,
                            height: self.frame.height)
        return self
    }
    
    @discardableResult
    func frameCenterVerticalToSuper(of view: UIView) -> UIView {
        self.frame = CGRect(x: self.frame.origin.x,
                            y: view.frame.height/2-self.frame.height/2,
                            width: self.frame.width,
                            height: self.frame.height)
        return self
    }
    
    @discardableResult
    func frameToHeight(of height: CGFloat) -> UIView {
        self.frame = CGRect(x: self.frame.origin.x,
                            y: self.frame.origin.y,
                            width: self.frame.width,
                            height: height)
        return self
    }
}

extension UIViewController {
    func add(_ childs: [UIViewController]) {
        for child in childs {
            addChild(child)
            view.addSubview(child.view)
            child.didMove(toParent: self)
        }
    }
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
