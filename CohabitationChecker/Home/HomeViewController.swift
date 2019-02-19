//
//  HomeViewController.swift
//  CohabitationChecker
//
//  Created by 山口賢登 on 2019/02/14.
//  Copyright © 2019 山口賢登. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapChecker(_ sender: UIButton) {
        guard let checkVC = R.storyboard.checkViewController.instantiateInitialViewController() else { return }
        //self.present(checkVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(checkVC, animated: true)
    }
    
}
