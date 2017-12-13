//
//  ViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/4.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import YogaKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    @IBAction func push(_ sender: UIButton) {
        
        self.present(LoadCardViewController(), animated: true, completion: nil)
        
    }
    
}
