//
//  BaseViewController.swift
//  iOSBaseProject
//
//  Created by admin on 16/5/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

//  BaseViewController should be super class of most viewControllers in project
//  we define general appearences and implement some important methods here

class BaseViewController: UIViewController {
    
    // Mark: Some methods will be used frequently
    
    
    // Mark:Some methods can be overridden
    func backButtonTapped() -> Void {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.black
        
        //custom back button. --if you want more customs, see BaseNavigationController.swift
        if let viewControllers = navigationController?.viewControllers {
            if viewControllers.count > 0 && self != viewControllers[0] {
                navigationItem.leftBarButtonItems = leftBarButtonItems
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate lazy var leftBarButtonItems: [UIBarButtonItem] = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.setImage(UIImage(named: BaseStyle.backButtonImageName), for: UIControlState())
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let buttonItem = UIBarButtonItem(customView: button)
        let spacerItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacerItem.width = -18;
        return [spacerItem, buttonItem]
    }()
    
}
