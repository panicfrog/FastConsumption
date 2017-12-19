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

enum StatusTipsViewStyle {
    case normal
    case overdue
    var backgroundImage: UIImage {
        switch self {
        case .normal:
            return Image.home_card_bule_figure()!
        case .overdue:
            //TODO: 需要橙色的切图 替换掉这个蓝色的
            return Image.home_card_bule_figure()!
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

// 展示用消息框 |灰色标题-黑色内容|
func messageShowCellView(title: String, message: String) -> UIView {
    let messageShowContainerView = UIView()
    messageShowContainerView.layout(Layout.messageShowContainerViewLayout)
    
    let messageShowTitleLabel = UILabel()
    messageShowTitleLabel.layout(Layout.messageShowTitleLabelLayout)
    messageShowTitleLabel.font = UIFont.systemFont(ofSize: 14.scaleHeight)
    messageShowTitleLabel.textColor = grayColor
    messageShowTitleLabel.text = title
    messageShowContainerView.addSubview(messageShowTitleLabel)
    
    let messageShowMessageLabel = UILabel()
    messageShowMessageLabel.text = message
    messageShowMessageLabel.textColor = blackColor
    messageShowMessageLabel.font = UIFont.systemFont(ofSize: 16.scaleHeight)
    messageShowContainerView.addSubview(messageShowMessageLabel)
    
    return messageShowContainerView
}


// 不同状态的分割视图 分为普通模式和逾期两种状态
func statusTipsView(text: NSAttributedString, type: StatusTipsViewStyle) -> UIView {
    let statusTipsContainerView = UIView()
    statusTipsContainerView.layout(Layout.statusTipsContainerViewLayout)
    
    let statusBackgroundImageView = UIImageView()
    statusBackgroundImageView.layout(Layout.statusBackgroundImageViewLayout)
    statusBackgroundImageView.image = type.backgroundImage
    statusTipsContainerView.addSubview(statusBackgroundImageView)
    
    let statusTipsLabel = UILabel()
    statusTipsLabel.layout(Layout.statusTipsLabelLayout)
    statusTipsLabel.attributedText = text
    statusTipsLabel.font = UIFont.systemFont(ofSize: 22.scaleHeight)
    statusBackgroundImageView.addSubview(statusTipsLabel)
    
    let statusSepImageView = UIImageView()
    statusSepImageView.layout(Layout.statusSepImageViewLayout)
    statusSepImageView.image = Image.split_line()
    statusTipsContainerView.addSubview(statusSepImageView)
    return statusTipsContainerView
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
    //-------------------------------------------
    
    static var loanInputContainerViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .justifyContent(.flexStart)
            .paddingLeft(YGValue(21.5.scaleWidth))
            .paddingRight(YGValue(21.5.scaleWidth))
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
    //-------------------------------------------
  
    static var messageShowContainerViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .height(YGValue(60.scaleHeight))
            .paddingLeft(YGValue(21.5.scaleWidth))
            .paddingRight(YGValue(21.5.scaleWidth))
    }
    static var messageShowTitleLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .width(YGValue(90.scaleWidth))
            .height(YGValue(60.scaleHeight))
    }
    
    static var messageShowMessageLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .height(YGValue(60.scaleHeight))
    }
    //-------------------------------------------
    
    static var statusTipsContainerViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .height(YGValue(80.scaleHeight))
            .flexDirection(.row)
            .justifyContent(.center)
            .alignItems(.center)
    }
    
    static var statusBackgroundImageViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .height(YGValue(21.scaleHeight))
            .flexDirection(.row)
            .justifyContent(.center)
            .alignItems(.center)
            .aspectRatio(558.0/27.0)
    }
    
    static var statusTipsLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
    }
    
    static var statusSepImageViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .width(YGValue(347.scaleWidth))
            .aspectRatio(695.0/47.0)
    }
}

