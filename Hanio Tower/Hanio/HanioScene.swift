//
//  HanioScene.swift
//  DingGame
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

class HanioScene: UIView {
    
    lazy var starLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: HanioConst.sceneTopMargin, width: self.bounds.size.width, height: HanioConst.starHeight))
        label.textAlignment = .center
        label.text = "⭐️"
        label.font = UIFont.systemFont(ofSize: HanioConst.starHeight)
        return label
    }()
    
    lazy var poles: [Pole] = {  //  poles[0]: top, poles[1]: left, poles[2]: right
        var array = [Pole]()
        for i in 1...HanioConst.polesCount {
            let pole = Pole()
            let recognizer = UITapGestureRecognizer()
            recognizer.addTarget(self, action: #selector(poleTapped))
            pole.addGestureRecognizer(recognizer)
            array.append(pole)
        }
        return array
    }()
    
    lazy var cover = UIView()
    var tapEnabled: Bool {
        get {
            return cover.isHidden
        }
        set {
            if !newValue {
                cover.frame = bounds
                addSubview(cover)
                bringSubview(toFront: cover)
            }
            cover.isHidden = newValue
        }
    }
    
    weak var fromPole: Pole?, toPole: Pole?
    weak var diskToMove: Disk?
    
    var disks: Int {
        get { return p_disks}
        set {
            guard newValue != p_disks else { return }
            guard newValue <= HanioConst.limitedDisks else { return }
            p_disks = newValue
            layoutPoles()
        }
    }
    var p_disks = 0
    
    func refresh() {
        for pole in poles {
            pole.clear()
        }
        layoutPoles()
    }
    
    func layoutPoles() {
        
        let topMargin = HanioConst.starHeight + HanioConst.sceneTopMargin

        addSubview(starLabel)

        let poleWidth = bounds.size.width * 0.5
        
        let diskHeight = HanioConst.diskHeight
        let singleDiskWidth = diskHeight * 1.2
        let countF = CGFloat(disks)
        let poleHeight = diskHeight * (countF + 1.5)
        let maxPoleHeight = (bounds.size.height - topMargin) * 0.5
        let verticalMargin = (maxPoleHeight - poleHeight) * 0.5
        
        for (i, pole) in poles.enumerated() {
            pole.capacity = disks
            pole.diskHeight = diskHeight
            
            switch i {
            case 0:
                pole.frame = CGRect(x: 0.5 * poleWidth, y: topMargin + verticalMargin, width: poleWidth, height: poleHeight)
            case 1:
                pole.frame = CGRect(x: 0, y: topMargin + maxPoleHeight + verticalMargin, width: poleWidth, height: poleHeight)
            default:
                pole.frame = CGRect(x: poleWidth, y: topMargin + maxPoleHeight + verticalMargin, width: poleWidth, height: poleHeight)
            }
            addSubview(pole)
        }
        
        let leftPole = poles[1]
        for i in (1...disks).reversed() {
            let frame = CGRect(x: 0, y: 0, width: 1.1 * singleDiskWidth * CGFloat(i), height: diskHeight)
            let disk = Disk(frame: frame)
            disk.number = i
            leftPole.push(disk)
        }
        
    }
    
    func poleTapped(recognizer: UITapGestureRecognizer) {
        guard let pole: Pole = recognizer.view as? Pole else { return }
        
        tapEnabled = false
        if fromPole == nil && toPole == nil {
            guard !pole.isEmpty else {
                tapEnabled = true
                return
            }
            fromPole = pole
            diskToMove = pole.pop()
            tapEnabled = true
            return
        }
        
        toPole = pole
        
        func clear() {
            fromPole = nil
            toPole = nil
            diskToMove = nil
            tapEnabled = true
        }
        
        guard let fromPole = fromPole, let toPole = toPole, let diskToMove = diskToMove else {
            clear()
            return
        }
        
        func reset() {
            fromPole.push(diskToMove)
            clear()
        }
        
        if fromPole === toPole {
            reset()
            return
        }
        
        if let toDisk = toPole.peek() {
            if toDisk.number < diskToMove.number {
                reset()
                return
            }
        }
        let diskSize = diskToMove.frame.size
        let fromPoint = CGPoint(x: fromPole.center.x - 0.5 * diskSize.width, y: fromPole.frame.origin.y)
        let toPoint = CGPoint(x: toPole.center.x - 0.5 * diskSize.width, y: toPole.frame.origin.y)
        
        diskToMove.frame.origin = fromPoint
        addSubview(diskToMove)
        
//        let controlPoint = CGPoint(x: (fromPoint.x + toPoint.x) * 0.5, y: min(fromPoint.y, toPoint.y) - 20)
//        
//        diskToMove.bezierMove(to: toPoint, control: controlPoint, duration: 0.8) {
//            toPole.push(diskToMove)
//            clear()
//            if self.poles[0].total == self.disks {
//                self.successAction()
//            }
//        }
        
        UIView.animate(withDuration: 0.8, animations: {
            diskToMove.frame.origin = toPoint
        }) { _ in
            toPole.push(diskToMove)
            clear()
            if self.poles[0].total == self.disks {
                self.successAction()
            }
        }
        
    }
    
    func successAction()  {
        starLabel.text = "🌟"
        backgroundColor = HanioConst.poleColor
        tapEnabled = false
    }
}
