//
//  CustomTransitionNavigationController.swift
//  CohabitationChecker
//
//  Created by 山口賢登 on 2019/02/20.
//  Copyright © 2019 山口賢登. All rights reserved.
//

import UIKit

class CustomTransitionNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.view.layer.removeAllAnimations()
        if !animated {
            return
        }
        let transition:CATransition = CATransition()
        transition.duration = 0.3
        switch viewController {
        case is ResultViewController:
            transition.type = CATransitionType.fade
            transition.subtype = CATransitionSubtype.fromTop
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        default:
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromTop
        }
        self.view.layer.add(transition,forKey:kCATransition)
        return super.pushViewController(viewController, animated: false)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        self.view.layer.removeAllAnimations()
        if animated {
            let transition:CATransition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromBottom
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            self.view.layer.add(transition,forKey:kCATransition)
        }
        return super.popToRootViewController(animated: false)
    }
}
