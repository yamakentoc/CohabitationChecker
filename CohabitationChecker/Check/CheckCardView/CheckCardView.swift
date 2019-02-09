//
//  CheckCardView.swift
//  
//
//  Created by 山口賢登 on 2019/02/07.
//

import UIKit

class CheckCardView: UIView {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var firstAnswerLabel: UILabel!
    @IBOutlet weak var secondAnswerLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            view.layer.backgroundColor = UIColor.white.cgColor
            view.layer.cornerRadius = 18
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.3//影の濃さ
            view.layer.shadowRadius = 4//ぼかし
            view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
            self.addSubview(view)
        }
    }
    
    func setLabel(_ itemText: String, _ firstAnswer: String, _ secondAnswer: String) {
        self.itemLabel.text = itemText
        self.firstAnswerLabel.text = firstAnswer
        self.secondAnswerLabel.text = secondAnswer
    }
    
}
