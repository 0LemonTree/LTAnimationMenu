//
//  ViewController.swift
//  LTAimationMenu
//
//  Created by Xu on 08/21/2020.
//  Copyright (c) 2020 Xu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    func layout() {
        
        let animView = AnimationMenu()
        
        view.addSubview(animView)
        
        animView.snp.makeConstraints { (make) in
            
            make.centerY.equalToSuperview()
            make.right.equalTo(-30)
            make.size.equalTo(CGSize(width: 39, height: 44
            ))
        }
    }
}

