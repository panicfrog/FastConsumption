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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = UIButton()
        button1.rx.tap
            .subscribe(onNext: { [unowned self] in
                self.present(LoginViewController.instantiate(), animated: true, completion: nil)
            })
        .disposed(by: bag)
        
        let button2 = UIButton()
        button2.rx.tap
            .subscribe(onNext: { [unowned self] in
                self.present(RegisterViewController.instantiate(), animated: true, completion: nil)
            })
            .disposed(by: bag)
        
        let button3 = UIButton()
        button3.rx.tap
            .subscribe(onNext: { [unowned self] in
                self.present(RetrievePasswordViewController.instantiate(), animated: true, completion: nil)
            })
            .disposed(by: bag)
        
        let button4 = UIButton()
        button4.rx.tap
            .subscribe(onNext: { [unowned self] in
                self.present(ResetPasswordViewController.instantiate(), animated: true, completion: nil)
            })
            .disposed(by: bag)
        
        button1.backgroundColor = .red
        button2.backgroundColor = .blue
        button3.backgroundColor = .yellow
        button4.backgroundColor = .cyan
        
        let conentView = UIView(frame: CGRect(x: 0, y: 200, width: ScreenWidth , height: 40))
        
        view.addSubview(conentView)
        conentView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .row
            layout.justifyContent = .center
            layout.marginHorizontal = 5
        }
        
        button1.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
        }
        
        button2.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
        }
        
        button3.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
        }
        
        button4.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
        }
        
        conentView.addSubview(button1)
        conentView.addSubview(button2)
        conentView.addSubview(button3)
        conentView.addSubview(button4)
        
        conentView.yoga.applyLayout(preservingOrigin: true)
    }
    
}

