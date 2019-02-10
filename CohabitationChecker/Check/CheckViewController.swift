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

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.layer.shadowColor = UIColor.black.cgColor
            titleLabel.layer.shadowOpacity = 0.5//影の濃さ
            titleLabel.layer.shadowRadius = 4//ぼかし
            titleLabel.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        }
    }
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
        initGradation()
        initButton(nextButton)
        initButton(backButton)
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        self.kolodaView.swipe(.up)
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.kolodaView.revertAction()
    }
    
    func initGradation() {
        let topColor = UIColor(166, 192, 254)
        let bottomColor = UIColor(246, 128, 132)
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func initButton(_ button: UIButton) {
        button.layer.cornerRadius = view.bounds.height * 0.04
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5//影の濃さ
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

