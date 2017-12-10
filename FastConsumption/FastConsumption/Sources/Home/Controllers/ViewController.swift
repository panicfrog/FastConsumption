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
    var yoga: YGLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let containerView = UIView(frame: CGRect(x: 0, y: 200, width: ScreenWidth, height: 300))
        view.addSubview(containerView)
        
        containerView.layout(Layout.containerViewLayout)

        let viewBlue = UIView()
        viewBlue.layout(Layout.baseLayout)
        viewBlue.backgroundColor = .blue
        containerView.addSubview(viewBlue)

        let viewRed = UIView()
        viewRed.backgroundColor = .red
        viewRed.layout(Layout.baseLayout)
        containerView.addSubview(viewRed)

        containerView.yoga.applyLayout(preservingOrigin: true)
    }
    struct Layout {
        static var containerViewLayout:VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.row)
                .justifyContent(.center)
        }
        
        static var redLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexGrow(2)
        }
        
        static var blueLayout: VirtualLayout {
            return VirtualLayout()
            .isEnable(true)
            .flexGrow(1)
        }
        
        static var baseLayout: VirtualLayout {
            let layout = VirtualLayout()
            layout.isEnabled = true
            layout.flexGrow = 1
            return layout
        }
    }
}

//    static var redLayout: YGLayout {
//        return YGLayout()
//            .isEnable(true).flexGrow(2)
//    }
//
//    static var blueLayout: YGLayout {
//        return YGLayout().isEnable(true).flexGrow(1)
//    }
//
//    static var horLayout: YGLayout {
//        return YGLayout().isEnable(true).flexDirection(.row)
//            .alignItems(.spaceBetween)
//    }
    
    
    
    
    //        let button1 = UIButton()
    //        button1.rx.tap
    //            .subscribe(onNext: { [unowned self] in
    //                self.present(LoginViewController.instantiate(), animated: true, completion: nil)
    //            })
    //        .disposed(by: bag)
    //
    //        let button2 = UIButton()
    //        button2.rx.tap
    //            .subscribe(onNext: { [unowned self] in
    //                self.present(RegisterViewController.instantiate(), animated: true, completion: nil)
    //            })
    //            .disposed(by: bag)
    //
    //        let button3 = UIButton()
    //        button3.rx.tap
    //            .subscribe(onNext: { [unowned self] in
    //                self.present(RetrievePasswordViewController.instantiate(), animated: true, completion: nil)
    //            })
    //            .disposed(by: bag)
    //
    //        let button4 = UIButton()
    //        button4.rx.tap
    //            .subscribe(onNext: { [unowned self] in
    //                self.present(ResetPasswordViewController.instantiate(), animated: true, completion: nil)
    //            })
    //            .disposed(by: bag)
    //
    //        button1.backgroundColor = .red
    //        button2.backgroundColor = .blue
    //        button3.backgroundColor = .yellow
    //        button4.backgroundColor = .cyan
    //
    //        let conentView = UIView(frame: CGRect(x: 0, y: 200, width: ScreenWidth , height: 40))
    //
    //        view.addSubview(conentView)
    //        conentView.layout(Layout.horLayout)
    //
    //        button1.layout(Layout.baseLayout)
    //        button2.layout(Layout.baseLayout)
    //        button3.layout(Layout.baseLayout)
    //        button4.layout(Layout.baseLayout)
    //
    //        conentView.addSubview(button1)
    //        conentView.addSubview(button2)
    //        conentView.addSubview(button3)
    //        conentView.addSubview(button4)
    //
    //        conentView.yoga.applyLayout(preservingOrigin: true)
    

