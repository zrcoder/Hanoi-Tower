//
//  ViewController.swift
//  Hanio Tower
//
//  Created by admin on 2016/12/2.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    lazy var cards: SwipeableCards = SwipeableCards()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cardsWidth = screenWidth * 0.8
        let cardsHeight = cardsWidth * 1.2
        cards.frame = CGRect(x: screenWidth * 0.1, y: (screenHeight - cardsHeight) * 0.5, width: cardsWidth, height: cardsHeight)
        view.addSubview(cards)
        cards.offset = (CardsConst.offset.x, CardsConst.offset.y)
        cards.showedCyclically = false
        cards.numberOfVisibleItems = HanioConst.limitedDisks
        cards.dataSource = self
        cards.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: SwipeableCardsDataSource, SwipeableCardsDelegate {
    func numberOfTotalCards(in cards: SwipeableCards) -> Int {
        return HanioConst.limitedDisks
    }
    func view(for cards: SwipeableCards, index: Int, reusingView: UIView?) -> UIView {
        var hanioScene = reusingView as? HanioScene
        if hanioScene == nil {
            let count = HanioConst.limitedDisks
            let countF = CGFloat(count)
            let width = cards.frame.size.width - CardsConst.offset.x *  (countF - 1)
            let height = cards.frame.size.height - CardsConst.offset.y *  (countF - 1)
            let frame = CGRect(x: 0, y: 0, width: width , height: height)
            hanioScene = HanioScene(frame: frame)
            hanioScene?.layer.cornerRadius = 10
        }
        if index == 0 {
            hanioScene?.disks = index + 1
        }
        hanioScene?.tag = index
        hanioScene?.layer.backgroundColor = CardsConst.colors[index].cgColor
        return hanioScene!
    }
    func cards(_ cards: SwipeableCards, didRemovedItemAt index: Int) {
        let i = (index + 1) % HanioConst.limitedDisks
        if let hanioScene = cards.viewWithTag(i) as? HanioScene {
            hanioScene.disks = i + 1
        }
        guard index == HanioConst.limitedDisks - 1 else { return }
        run(after: 0.2) {
            cards.reloadData()
        }
    }
}
