//
//  Bezier.swift
//  DingGame
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit



struct Bezier {
    static func move(view: UIView,
                     to: CGPoint,
                     control: CGPoint,
                     duration: TimeInterval,
                     options: UIViewAnimationOptions = .curveEaseInOut,
                     completion: (() -> Void)? = nil) {
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            let path = UIBezierPath()
            path.move(to: view.frame.origin)
            path.addQuadCurve(to: to, controlPoint: control)
            
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.fillMode = kCAFillModeForwards
            animation.path = path.cgPath
            animation.duration = duration
            animation.isRemovedOnCompletion = false
            view.layer.add(animation, forKey: "BezierMoving")
        })
        run(after: duration) {
            view.layer.removeAnimation(forKey: "BezierMoving")
            completion?()
        }
    }
}

extension UIView {
    func bezierMove(to: CGPoint,
                    control: CGPoint,
                    duration: TimeInterval,
                    options: UIViewAnimationOptions = .curveLinear,
                    completion: (() -> Void)? = nil ) {
        
        Bezier.move(view: self,
                      to: to,
                      control: control,
                      duration: duration,
                      options: options,
                      completion: completion)
    }
}
