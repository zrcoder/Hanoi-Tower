//
//  Pole.swift
//  DingGame
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

class Pole: UIView {
    private var disks = [Disk]()
    private lazy var verticalPole = UIView()
    
    var diskHeight: CGFloat = 0 {
        didSet { addVerticalPole() }
    }
    var capacity: Int = 0 {
        didSet { addVerticalPole() }
    }
    override var frame: CGRect {
        didSet { addVerticalPole() }
    }
    private func addVerticalPole() {
        guard capacity > 0 && diskHeight > 1 && bounds.size.width > 1 else { return }
        
        let capacityF: CGFloat = CGFloat(capacity)
        let width = HanioConst.poleWidth
        let height = (capacityF + 0.5) * diskHeight
        let x = (bounds.size.width - width) * 0.5
        let y = diskHeight
        
        let frame = CGRect(x: x, y: y, width: width, height: height)
        
        verticalPole.frame = frame
        verticalPole.layer.cornerRadius = width * 0.5
        verticalPole.layer.backgroundColor = HanioConst.poleColor.cgColor
        addSubview(verticalPole)
    }
    var total: Int { return disks.count }
    var isEmpty: Bool { return total == 0 }
    
    func push(_ disk: Disk) {
        let countF = CGFloat(total)
        disks.append(disk)
        
        disk.center = CGPoint(x: verticalPole.center.x, y: verticalPole.frame.origin.y - 0.5 * diskHeight)
        addSubview(disk)
        
        UIView.animate(withDuration: 0.4) {
            disk.center = CGPoint(x: self.verticalPole.center.x, y: self.bounds.size.height - self.diskHeight * (countF + 0.5))
        }
    }
    
    func pop() -> Disk? {
        guard !isEmpty else { return nil }
        let disk = disks.removeLast()
        UIView.animate(withDuration: 0.4) {
            disk.center = CGPoint(x: self.verticalPole.center.x, y: self.diskHeight * 0.5)
        }
        return disk
    }
    
    func peek() -> Disk? {
        return disks.last
    }
    
    func clear()  {
        disks.removeAll()
        for v in subviews {
            v.removeFromSuperview()
        }
    }
}
