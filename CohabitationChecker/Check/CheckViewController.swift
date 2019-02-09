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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var itemText:[String] = ["休日の過ごし方", "トイレットペーパー", "バスタオルを使う頻度"]
    var firstAnswer: [String] = ["外に出かける", "シングル", "毎日替える"]
    var secondAnswer: [String] = ["家で過ごす", "ダブル", "何日か使ってから"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.dataSource = self
        kolodaView.delegate = self
        initButton(nextButton)
        initButton(backButton)
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        self.kolodaView.swipe(.up)
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.kolodaView.revertAction()
    }
    
    func initButton(_ button: UIButton) {
        button.layer.cornerRadius = backButton.bounds.width / 2
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3//影の濃さ
        button.layer.shadowRadius = 4//ぼかし
        button.layer.shadowOffset = CGSize(width: 0, height: 1.5)
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

