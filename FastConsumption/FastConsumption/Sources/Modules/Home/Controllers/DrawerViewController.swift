//
//  ViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/4.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import DeviceKit

public class DrawerViewController: UIViewController {
    
    let side: UIViewController
    var bottom: UIViewController?
    
    public init(side: UIViewController, bottom: UIViewController?) {
        self.side = side
        self.bottom = bottom
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        //TODO: 为了测试使用
        view.backgroundColor = .green
        configBottomViewController()
        configSideViewController()
        
        delay(5) { self.showSide() }
        delay(10) { self.hideSide() }
        
        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .yellow
        delay(12) { self.setBottomViewController(bottomViewController: yellowViewController) }
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .blue
        delay(15) { self.setBottomViewController(bottomViewController: blueViewController) }
        
        delay(18) { self.showSide() }
        delay(20) { self.hideSide() }
        
    }
    
    
    func configSideViewController() {
        addChildViewController(side)
        side.view.frame = side.view.frame.offsetBy(dx: -side.view.frame.width, dy: 0)
        side.view.backgroundColor = .red
        view.addSubview(side.view)
        side.didMove(toParentViewController: self)
    }
    
    func configBottomViewController() {
        guard let bottomViewController = bottom else { return }
        addChildViewController(bottomViewController)
        view.addSubview(bottomViewController.view)
        bottomViewController.didMove(toParentViewController: self)
    }
    
    public func setBottomViewController(bottomViewController: UIViewController) {
        if let bottomVC = bottom {
            addChildViewController(bottomViewController)
            view.insertSubview(bottomViewController.view, at: 0)
            bottomViewController.didMove(toParentViewController: self)
            
            bottomVC.willMove(toParentViewController: nil)
            bottomVC.view.removeFromSuperview()
            bottomVC.removeFromParentViewController()
        }
        else {
            addChildViewController(bottomViewController)
            view.insertSubview(bottomViewController.view, at: 0)
            bottomViewController.didMove(toParentViewController: self)
        }
        bottom = bottomViewController
    }
}

protocol DrawerSiderShowProtocol {
    func showSide()
}
protocol DrawerSiderHideProtocol {
    func hideSide()
}

extension DrawerViewController: DrawerSiderShowProtocol,DrawerSiderHideProtocol {
    public func hideSide() {
        UIView.animate(withDuration: 0.4, animations: {
            self.side.view.frame = self.view.bounds.offsetBy(dx: -self.view.bounds.width, dy: 0)
        })
    }
    
    public func showSide() {
        UIView.animate(withDuration: 0.4, animations: {
            self.side.view.frame = self.view.bounds
        })
    }
}

