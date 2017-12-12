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
    let bag = DisposeBag()
    
    let containerView = UIView()
    let viewRed = UIView()
    let viewBlue = UIView()
    let viewYellow = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.justifyContent = .center
            layout.flexGrow = 1
        }
        
        containerView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.justifyContent = .center
            layout.height = 200
        }
        view.addSubview(containerView)

        //蓝
        viewBlue.backgroundColor = .blue
        viewBlue.configureLayout { (layot) in
            layot.isEnabled = true
            layot.flexGrow = 1
        }
        containerView.addSubview(viewBlue)

        //红
        viewRed.backgroundColor = .red
        viewRed.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 2
        }
        containerView.addSubview(viewRed)
        
        //黄
        viewYellow.backgroundColor = .yellow
        viewYellow.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
        }
        containerView.addSubview(viewYellow)

        view.yoga.applyLayout(preservingOrigin: true)
    }
    
}
