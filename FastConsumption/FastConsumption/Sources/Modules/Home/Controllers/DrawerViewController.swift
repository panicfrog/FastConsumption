//
//  ViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/4.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import DeviceKit
import RxCocoa
import RxSwift

public class DrawerViewController: UIViewController {
    
    let side: UIViewController
    var bottom: Variable<UIViewController?>
    let viewModel: DrawerViewModel
    let bag = DisposeBag()
    
    public init(side: UIViewController, bottom: Variable<UIViewController?>) {
        self.side = side
        self.bottom = bottom
        self.viewModel = DrawerViewModel(bottom: bottom)
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
        setupUI()
        delay(1) { self.showSide() }
        delay(10) { self.hideSide() }
    }
    
    func setupUI() {
        let placehoderImageView = UIImageView(frame: view.bounds)
        placehoderImageView.image = Image.placehoder()
        view.insertSubview(placehoderImageView, at: 0)
        
        viewModel.placehoderHide.drive(onNext: { hide in
            placehoderImageView.isHidden = hide
        }).disposed(by: bag)
    }
    
    func configSideViewController() {
        addChildViewController(side)
        side.view.frame = side.view.frame.offsetBy(dx: -side.view.frame.width, dy: 0)
        view.addSubview(side.view)
        side.didMove(toParentViewController: self)
    }
    
    func configBottomViewController() {
        guard let bottomViewController = bottom.value else { return }
        addChildViewController(bottomViewController)
        view.addSubview(bottomViewController.view)
        bottomViewController.didMove(toParentViewController: self)
    }
    
    public func setBottomViewController(bottomViewController: UIViewController) {
        if let bottomVC = bottom.value {
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
        bottom.value = bottomViewController
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

