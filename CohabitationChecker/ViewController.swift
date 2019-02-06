//
//  ViewController.swift
//  CohabitationChecker
//
//  Created by 山口賢登 on 2019/02/04.
//  Copyright © 2019 山口賢登. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    var hoge:[String] = ["hiya", "huga"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initKolodaView()
    }
    
    func initKolodaView() {
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }

}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.open(URL(string: "https://yalantis.com/")!)
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .down, .right]
    }
}

extension ViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return hoge.count
    }
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIView()
        let size = self.view.bounds.width * 0.8
        view.frame = CGRect(x: 0, y: 0, width: size, height: size)
        view.layer.backgroundColor = UIColor.white.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        let label = UILabel()
        label.text = hoge[index]
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
        return view
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return nil//Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)![0] as? OverlayView
    }
}

