//
//  ResultViewController.swift
//  CohabitationChecker
//
//  Created by 山口賢登 on 2019/02/14.
//  Copyright © 2019 山口賢登. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapOKButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
