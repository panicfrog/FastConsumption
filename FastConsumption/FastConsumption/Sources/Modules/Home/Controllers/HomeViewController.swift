//
//  HomeViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/13.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import YogaKit

fileprivate  let textColor = UIColor(red: 58.0/255.0, green: 163.0/255.0, blue: 1.0, alpha: 1.0)
fileprivate  let quotaColor = UIColor(red: 3.0/255.0, green: 137.0/255.9, blue: 1.0, alpha: 1.0)
fileprivate  let viewPaddingHor:CGFloat = 14
fileprivate  let contentViewPadding:CGFloat = 12

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.layout(Layout.viewLayou)
        
        //1 上面的conent view
        let contentView = UIView()
        contentView.layout(Layout.contentViewLayout)
        view.addSubview(contentView)
        
        //1.1 上面logo 和认证按钮
        let logoContentView = UIView()
        logoContentView.layout(Layout.contentViewLayout)
        contentView.addSubview(logoContentView)
        
        //1.1.1 logo
        let logoImageView = UIImageView()
        logoImageView.image = Image.home_logo()
        logoImageView.layout(Layout.logoImageViewLayout)
        logoContentView.addSubview(logoImageView)
        
        //1.1.2 认证按钮
        let validButton = UIButton()
        validButton.layout(Layout.validButtonLayout)
        logoContentView.addSubview(validButton)
        
        //1.2 额度提示标签
        let loanTipLabel = UILabel()
        loanTipLabel.layout(Layout.loanButtonLayout)
        loanTipLabel.text = "——   最高可借   ——"
        loanTipLabel.font = UIFont.systemFont(ofSize: 13)
        loanTipLabel.textColor = textColor
        contentView.addSubview(loanTipLabel)
        
        //1.3 额度标签
        let quotaLabel = UILabel()
        quotaLabel.layout(Layout.quotaLabelLayout)
        quotaLabel.font = UIFont.systemFont(ofSize: 40)
        quotaLabel.text = "￥5000"
        quotaLabel.textColor = quotaColor
        contentView.addSubview(quotaLabel)
        
        //1.4 分割线
        let lineImageView = UIImageView()
        lineImageView.layout(Layout.lineImageViewLayout)
        lineImageView.image = Image.home_dotted()
        contentView.addSubview(lineImageView)
        
        //1.5 选中金额content view
        let loanedContentView = UIView()
        loanedContentView.layout(Layout.loanedContentViewLayout)
        contentView.addSubview(loanedContentView)
        
//        let imageView = UIImageView
        
        //2 下面的按钮
        let loanButton = UIButton()
        loanButton.layout(Layout.loanButtonLayout)
        contentView.addSubview(loanButton)
    }
    
    struct Layout {
        static var viewLayou: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.column)
                .justifyContent(.flexStart)
                .alignItems(.center)
                .paddingTop(YGValue(27.scaleHeight))
                .paddingHorizontal(YGValue(viewPaddingHor.scaleWidth))
        }
        
        static var contentViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.column)
                .justifyContent(.flexStart)
                .alignItems(.center)
                .paddingTop(YGValue(18.scaleHeight))
                .paddingHorizontal(YGValue(contentViewPadding))
        }
        
        static var logoContentViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.row)
                .justifyContent(.spaceBetween)
                .height(YGValue(27.5.scaleHeight))
        }
        
        static var logoImageViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .height(YGValue(27.5.scaleHeight))
                .aspectRatio(181.0/44.0)
        }
        
        static var validButtonLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .height(YGValue(27.5.scaleHeight))
                .aspectRatio(212.0/65.0)
                .marginRight(YGValue(-viewPaddingHor.scaleWidth))
        }
        
        
        static var loanTipLabelLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .marginTop(YGValue(31.5.scaleHeight))
        }
        
        static var quotaLabelLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .marginTop(YGValue(21.5.scaleHeight))
        }
        
        static var lineImageViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .marginTop(YGValue(53.scaleHeight))
                .height(YGValue(2.scaleHeight))
                .aspectRatio(647.0/2.0)
        }
        
        static var loanedContentViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.row)
                .width(YGValue(ScreenWidth-2*(contentViewPadding + viewPaddingHor)))
                .height(24)
                .alignItems(.flexEnd)
        }
        
        static var loanButtonLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
        }
        
    }
}
