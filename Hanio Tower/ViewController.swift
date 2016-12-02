//
//  ViewController.swift
//  Hanio Tower
//
//  Created by admin on 2016/12/2.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    lazy var hanioScene: HanioScene = HanioScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hanioScene.frame = CGRect(x: (screenWidth - 300) * 0.5, y: 80, width: 300, height: 400)
        view.addSubview(hanioScene)
        hanioScene.disks = 3
        hanioScene.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
