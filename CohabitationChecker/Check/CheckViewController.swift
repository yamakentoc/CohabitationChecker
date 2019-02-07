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
    var hoge:[String] = ["休日の過ごし方", "huga"]
    
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
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.up]
    }
    
    func kolodaSwipeThresholdRatioMargin(_ koloda: KolodaView) -> CGFloat? {
        return 0.1
    }
}

extension CheckViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 100//hoge.count
    }
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let checkCardView = CheckCardView(frame: self.kolodaView.frame)
        return checkCardView
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return nil//Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)![0] as? OverlayView
    }
}

