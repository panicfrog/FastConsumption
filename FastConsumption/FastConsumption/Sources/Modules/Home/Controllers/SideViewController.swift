//
//  ViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/4.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import YogaKit
import RxSwift
import RxCocoa

fileprivate let numberTextColor = UIColor(hex: "#3E3A39")
fileprivate let buttonSelecedBgColor = UIColor(hex: "#0389FF")

class SideViewController: UIViewController {
    var siderHideDelegate: DrawerSiderHideProtocol?
    var viewModel: SideViewModel!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.8)
        
        view.layout(Layout.viewLayout)
        
        //side
        let sideView = UIView()
        sideView.backgroundColor = .white
        sideView.layout(Layout.sideViewLayout)
        view.addSubview(sideView)
        
        // icon
        let iconImageView = UIImageView()
        iconImageView.layout(Layout.iconImageViewLayout)
        iconImageView.image = Image.sidebar_headportrait_icom()
        sideView.addSubview(iconImageView)
        
        // phone number
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 15.scaleHeight)
        phoneNumberLabel.text = "138****1234"
        phoneNumberLabel.textColor = numberTextColor
        phoneNumberLabel.layout(Layout.phoneNumberLabelLayout)
        sideView.addSubview(phoneNumberLabel)
        
        // 我的借款
        let myLoanButton = configButton(title: "我的借款   ",
                                        selectedImage: Image.sidebar_toborrow_pressed_icom()!,
                                        nomalImage: Image.sidebar_toborrow_icom()!)
        myLoanButton.yoga.marginTop(YGValue(38.scaleHeight))
        myLoanButton.isSelected = true
        sideView.addSubview(myLoanButton)
        
        // 我的银行卡
       let myCardsButton = configButton(title: "我的银行卡", selectedImage: Image.sidebar_bankcard_pressed_icom()!, nomalImage: Image.sidebar_bankcard_icom()!)
        sideView.addSubview(myCardsButton)
        
        // 我的认证
        let myValidButton = configButton(title: "我的认证   ", selectedImage: Image.sidebar_certification_pressed_icom()!, nomalImage: Image.sidebar_certification_icom()!)
        sideView.addSubview(myValidButton)

        // 常见问题
        let commonProblemButton = configButton(title: "常见问题   ", selectedImage: Image.sidebar_question_pressed_icom()!, nomalImage: Image.sidebar_question_icom()!)
        sideView.addSubview(commonProblemButton)
        
        // 退出账号
        let exitAccountButton = configButton(title: "退出账号   ", selectedImage: Image.sidebar_txitaccount_pressed_icom()!, nomalImage: Image.sidebar_txitaccount_icom()!)
        sideView.addSubview(exitAccountButton)
        
        // 客户电话
        let telTipLabel = UILabel()
        telTipLabel.layout(Layout.telTipLabelLayout)
        telTipLabel.text = "客户电话"
        telTipLabel.font = UIFont.systemFont(ofSize: 13.scaleHeight)
        sideView.addSubview(telTipLabel)
        
        // tel number
        let telNumberLabel = UILabel()
        telNumberLabel.layout(Layout.telNumberLabelLayout)
        telNumberLabel.text = "0755-86728705"
        telNumberLabel.font = UIFont.systemFont(ofSize: 14.scaleHeight)
        telNumberLabel.textColor = buttonSelecedBgColor
        sideView.addSubview(telNumberLabel)
        
        view.yoga.applyLayout(preservingOrigin: true)
        
        /// driver
        viewModel = SideViewModel()
        viewModel.myLoanSelected
            .drive(onNext: { selected in
                myLoanButton.isSelected = selected
            })
        .disposed(by: bag)
        
        viewModel.myCardsSelected
            .drive(onNext: { selected in
                myCardsButton.isSelected = selected
            })
        .disposed(by: bag)
        
        viewModel.myValidateSelected
            .drive(onNext: { selected in
              myValidButton.isSelected = selected
            })
        .disposed(by: bag)
        
        viewModel.myCommonProblemSelected
            .drive(onNext: { selected in
                commonProblemButton.isSelected = selected
            })
            .disposed(by: bag)
        
        viewModel.exitAccountSelected
            .drive(onNext: { selected in
                exitAccountButton.isSelected = selected
            })
            .disposed(by: bag)
        
        /// click
        myLoanButton.rx.tap.subscribe(onNext: {[unowned self] in
           self.viewModel.sideSelected.value = .myLoan
        }).disposed(by: bag)
        
        myCardsButton.rx.tap.subscribe(onNext: {[unowned self] in
            self.viewModel.sideSelected.value = .myCards
        }).disposed(by: bag)
        
        myValidButton.rx.tap.subscribe(onNext: {[unowned self] in
            self.viewModel.sideSelected.value = .myValidate
        }).disposed(by: bag)
        
        commonProblemButton.rx.tap.subscribe(onNext: {[unowned self] in
            self.viewModel.sideSelected.value = .commonProblem
        }).disposed(by: bag)
        
        exitAccountButton.rx.tap.subscribe(onNext: {[unowned self] in
            self.viewModel.sideSelected.value = .exitAccount
            AppSession.removeAccount()
        }).disposed(by: bag)
        
    }
    
    func configButton(title: String, selectedImage: UIImage, nomalImage: UIImage) -> UIButton {
        let button = UIButton()
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -13.scaleWidth, 0, 13.scaleWidth)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.scaleHeight)
        button.setImage(selectedImage, for: .selected)
        button.setImage(nomalImage, for: .normal)
        button.setTitle(title, for: .normal)
        button.setTitleColor(numberTextColor, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.setBackgroundImage(buttonSelecedBgColor.image(rect: CGRect(x: 0, y: 0, width: 203.scaleWidth, height: 53.scaleWidth)), for: .selected)
        button.setBackgroundImage(UIColor.white.image(rect: CGRect(x: 0, y: 0, width: 203.scaleWidth, height: 53.scaleWidth)), for: .normal)
        button.layout(Layout.sideButtonLayout)
        button.sizeThatFits(CGSize(width: 203.scaleWidth, height: 53.scaleWidth))
        return button
    }
}


fileprivate struct Layout {
    static var viewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
    }
    
    static var sideViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.column)
            .alignItems(.center)
            .paddingTop(84)
            .width(YGValue(203.scaleWidth))
    }
    
    static var phoneNumberLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
    }
    
    static var iconImageViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .width(YGValue(57.scaleWidth))
            .aspectRatio(1)
    }
    
    static var sideButtonLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .width(YGValue(203.scaleWidth))
            .height(YGValue(53.scaleWidth))
    }
    
    static var telTipLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginTop(YGValue(120.scaleHeight))
    }
    
    static var telNumberLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginTop(YGValue(13.5.scaleHeight))
    }
}
