//
//  commonView.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/15.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import YogaKit

fileprivate let orangeColor = UIColor(hex: "#FFA01A")
fileprivate let grayColor = UIColor(hex: "#9FA0A0")
fileprivate let blackColor = UIColor(hex: "#3E3A39")
fileprivate let blueColor = UIColor(hex: "#0389FF")

enum HorStartEndLabelViewType {
    case normal
    case orange
    var startColor: UIColor {
        switch self {
        case .normal:
           return grayColor
        case .orange:
            return orangeColor
        }
    }
    
    var endColor: UIColor {
        switch self {
        case .normal:
            return blackColor
        case .orange:
            return orangeColor
        }
    }
}

/// |文字...文字|
func horStartEndLabelView(start: String, end:String, type: HorStartEndLabelViewType) -> UIView{
    let containerView = UIView()
    containerView.layout(Layout.containerViewLayout)
    
    let startLabel = UILabel()
    startLabel.layout(Layout.startLabelLayout)
    startLabel.font = UIFont.systemFont(ofSize: 14.scaleHeight)
    startLabel.textColor = type.startColor
    startLabel.text = start
    containerView.addSubview(startLabel)
    
    let endLabel = UILabel()
    endLabel.layout(Layout.endLabelLayout)
    endLabel.font = UIFont.systemFont(ofSize: 14.scaleHeight)
    endLabel.textColor = type.endColor
    endLabel.text = end
    containerView.addSubview(endLabel)
    
    return containerView
}

///借款输入框 |黑色文字-输入框...按钮？|
func loanInputCellView(title: String, placeholder: String, actionTitle: String?) -> UIView {
    let loanInputContainerView = UIView()
    loanInputContainerView.layout(Layout.loanInputContainerViewLayout)
    
    let loanInputTitleLabel = UILabel()
    loanInputTitleLabel.layout(Layout.loanInputTitleLabelLayout)
    loanInputTitleLabel.textColor = blackColor
    loanInputTitleLabel.font = UIFont.systemFont(ofSize: 16.scaleHeight)
    loanInputTitleLabel.text = title
    loanInputTitleLabel.textAlignment = .left
    loanInputContainerView.addSubview(loanInputTitleLabel)
    
    let loanInputTextfield = UITextField()
    loanInputTextfield.layout(Layout.loanInputTextfieldLayout)
    loanInputTextfield.placeholder = placeholder
    loanInputTextfield.font = UIFont.systemFont(ofSize: 14.scaleHeight)
    loanInputContainerView.addSubview(loanInputTextfield)
    
    guard let buttonTitle = actionTitle else { return loanInputContainerView }
    
    let loanInputActionButton = UIButton()
    loanInputActionButton.layout(Layout.loanInputActionButtonLayout)
    loanInputActionButton.setTitle(buttonTitle, for: .normal)
    loanInputActionButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.scaleHeight)
    loanInputActionButton.setTitleColor(blueColor, for: .normal)
    loanInputContainerView.addSubview(loanInputActionButton)
    
    return loanInputContainerView
}

fileprivate struct Layout {
    static var containerViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .height(YGValue(40.scaleHeight))
            .justifyContent(.spaceBetween)
    }
    static var startLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .height(YGValue(40.scaleHeight))
    }
    
    static var endLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .height(YGValue(40.scaleHeight))
    }
    //---
    
    static var loanInputContainerViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .justifyContent(.flexStart)
            .paddingLeft(YGValue(21.5.scaleWidth))
            .height(YGValue(60.scaleHeight))
    }
    
    static var loanInputTitleLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .width(YGValue(90.scaleWidth))
            .height(YGValue(60.scaleHeight))
    }
    
    static var loanInputTextfieldLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .width(YGValue(160.scaleWidth))
            .height(YGValue(60.scaleHeight))
    }
    
    static var loanInputActionButtonLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .position(.absolute)
            .height(YGValue(60.scaleHeight))
            .rightBottom(x: 0, y: 0)
    }
    
    
}
