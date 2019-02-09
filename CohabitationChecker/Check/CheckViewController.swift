//
//  ViewController.swift
//  CohabitationChecker
//
//  Created by 山口賢登 on 2019/02/04.
//  Copyright © 2019 山口賢登. All rights reserved.
//

import UIKit
import Koloda

class CheckViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    var itemText:[String] = ["休日の過ごし方", "トイレットペーパー", "バスタオルを使う頻度"]
    var firstAnswer: [String] = ["外に出かける", "シングル", "毎日替える"]
    var secondAnswer: [String] = ["家で過ごす", "ダブル", "何日か使ってから"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initKolodaView()
    }
    
    @IBAction func tapUndoButton(_ sender: UIButton) {
        self.kolodaView.revertAction()
    }
    
    func initKolodaView() {
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }

}

extension CheckViewController: KolodaViewDelegate {
    //カードがなくなったときに呼ばれる
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.up]
    }
    
    func kolodaSwipeThresholdRatioMargin(_ koloda: KolodaView) -> CGFloat? {
        return 0.01
    }
    //スワイプしたに呼ばれる
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        
    }
}

extension CheckViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return itemText.count
    }
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let checkCardView = CheckCardView(frame: self.kolodaView.frame)
        checkCardView.setLabel(itemText[index], firstAnswer[index], secondAnswer[index])
        return checkCardView
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return nil
    }
}

