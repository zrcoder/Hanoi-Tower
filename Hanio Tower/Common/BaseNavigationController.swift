//
//  BaseNavigationController.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/26.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

/// A UINavigationController subclass allowing the interactive pop gesture to be recognized when the navigation bar is hidden or a custom back button is used.
// We can also custom appearance of the navigation bar in the impletion file(BaseNavigationController.m).
// Thanks for the idea goes to https://github.com/fastred/AHKNavigationController

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        duringPushAnimation = true
        super.pushViewController(viewController, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if delegate == nil {
            delegate = self
        }
        interactivePopGestureRecognizer?.delegate = self        
        
        // Mark: custom the navigation bar
        // (It's better to custom the back button in BaseViewController, because you can override the button action in a single view controller. --see BaseViewController.swift)
        
        // Title
        navigationBar.titleTextAttributes = BaseStyle.navigationBarTitleTextAttributes
        // Background and bottom line
        navigationBar.setBackgroundImage(imageWithColor(BaseStyle.navigationBarBackgroundColor, size: CGSize(width: screenWidth, height: 64)), for: .default)
        navigationBar.shadowImage = imageWithColor(BaseStyle.navigationBarShadowImageColor, size: CGSize(width: screenWidth, height: 1))
    }
    
    // Mark: UINavigationControllerDelegate
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if interactivePopGestureRecognizer != nil {
            if let delegate = interactivePopGestureRecognizer!.delegate {
                assert(delegate === self, "BaseNavigationController won't work correctly if you change interactivePopGestureRecognizer's delegate.")
            }
        }
        duringPushAnimation = false
        realDelegate?.navigationController?(navigationController, didShow: viewController, animated: animated)
    }
    
    // Mark: UIGestureRecognizerDelegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer == interactivePopGestureRecognizer) {
            return viewControllers.count > 1 && !duringPushAnimation
        }
        return true
    }
    
    fileprivate var duringPushAnimation = false
    fileprivate var realDelegate: UINavigationControllerDelegate?
    
    deinit {
        delegate = nil
        interactivePopGestureRecognizer?.delegate = nil
    }

}
