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
        
        print(ScreenWidth)
        print(ScreenHeight)
       
    }
    @IBAction func push(_ sender: UIButton) {
//        self.present(HomeViewController(), animated: true, completion: nil)
        let drawerViewController = DrawerViewController(side: SideViewController(), bottom: nil)
        self.present(drawerViewController, animated: true, completion: nil)
    }
    
}
