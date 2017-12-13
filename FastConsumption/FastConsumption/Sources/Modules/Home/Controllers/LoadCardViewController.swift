//
//  LoadCardViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/13.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import YogaKit

class LoadCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        view.layout(Layout.viewLayout)
        view.backgroundColor = .white
        
        // 1. 闪电花
        let lightingView = UIImageView()
        lightingView.isUserInteractionEnabled = true
        lightingView.image = Image.certification_bg()
        lightingView.layer.cornerRadius = 5
        lightingView.layer.masksToBounds = true
        lightingView.layout(Layout.lightingViewLayout)
        view.addSubview(lightingView)
        
        // 1.2 logo content
        let logoConentView = UIView()
        logoConentView.layout(Layout.logoConentViewLayout)
        lightingView.addSubview(logoConentView)
        
        // 1.2.1 logo 图片
        let logoImageView = UIImageView()
        logoImageView.image = Image.home_logo_blue()
        logoImageView.layout(Layout.logoImageView)
        logoConentView.addSubview(logoImageView)
        
        // 1.2.1 认证按钮
        let myVildeButton = UIButton()
        myVildeButton.layout(Layout.myVildeButtonLayout)
        myVildeButton.setBackgroundImage(Image.home_icon(), for: .normal)
        myVildeButton.layer.cornerRadius = (21.0/2).scaleHeight
        logoConentView.addSubview(myVildeButton)
        
        // 1.3 信用额度标签
        let creditlineLabel = UILabel()
        creditlineLabel.layout(Layout.creditlineLabelLayout)
        creditlineLabel.font = UIFont.systemFont(ofSize: 10)
        creditlineLabel.textColor = .white
        creditlineLabel.text = "——   信用额度   ——"
        lightingView.addSubview(creditlineLabel)
        
        // 1.4 额度标签
        let quotaLabel = UILabel()
        quotaLabel.layout(Layout.quotaLabelLayout)
        quotaLabel.text = "￥5000"
        quotaLabel.textColor = .white
        quotaLabel.font = UIFont.systemFont(ofSize: 30)
        lightingView.addSubview(quotaLabel)
        
        // 1.5 提额按钮
        let mentionButton = UIButton()
        mentionButton.setTitle("如何提高通过率？", for: .normal)
        mentionButton.layout(Layout.mentionButtonLayout)
        mentionButton.titleLabel?.font = UIFont.systemFont(ofSize: 8)
        mentionButton.layer.cornerRadius = (22/2).scaleHeight
        mentionButton.layer.masksToBounds = true
        mentionButton.layer.borderColor = UIColor.white.cgColor
        mentionButton.layer.borderWidth = 0.5
        lightingView.addSubview(mentionButton)
        
        let figureImageView = UIImageView()
        figureImageView.image = Image.home_card_bule_figure()
        figureImageView.layout(Layout.figureImageView)
        lightingView.addSubview(figureImageView)
        
        let figureTipLabel = UILabel()
        figureTipLabel.layout(Layout.figureTipLabel)
        figureTipLabel.textColor = .white
        figureTipLabel.text = "请30日后再次申请"
        figureTipLabel.font = UIFont.systemFont(ofSize: 10)
        figureImageView.addSubview(figureTipLabel)
        
//        let threeSecView = UIView()
//        lightingView.layout(Layout.threeViewLayout)
//        view.addSubview(threeSecView)
        
        view.yoga.applyLayout(preservingOrigin: true)
    }
    
    
    struct Layout {
        static var viewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .paddingHorizontal(YGValue(18.scaleWidth))
                .paddingTop(YGValue(13.scaleHeight))
                .justifyContent(.flexStart)
            
        }
        static var lightingViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.column)
                .justifyContent(.flexStart)
                .alignItems(.center)
                .paddingTop(YGValue(13.scaleHeight))
                .aspectRatio(340.0/180.0)
        }
        
        static var logoConentViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.row)
                .justifyContent(.spaceBetween)
                .height(YGValue(21.scaleHeight))
                .width(YGValue(ScreenWidth - 36.scaleWidth))
        }
        
        static var logoImageView: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .height(YGValue(21.scaleHeight))
                .marginLeft(YGValue(18.scaleWidth))
                .aspectRatio(181.0/44.0)
        }
       
        static var myVildeButtonLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .height(YGValue(21.scaleHeight))
                .aspectRatio(75.0/21.0)
        }
        
        static var creditlineLabelLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .marginTop(YGValue(18.scaleHeight))
        }
        
        static var quotaLabelLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .marginTop(YGValue(14.scaleHeight))
        }
        
        static var mentionButtonLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .height(YGValue(22.scaleHeight))
                .aspectRatio(95.0/22.0)
                .marginTop(YGValue(11.5.scaleHeight))
        }
        
        static var figureImageView: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .height(YGValue(13.scaleHeight))
                .aspectRatio(558.0/27.0)
                .flexDirection(.row)
                .justifyContent(.center)
                .marginTop(YGValue(13.5.scaleHeight))
        }
        
        static var figureTipLabel: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
        }
        
        //        static var threeViewLayout: VirtualLayout {
        //            return VirtualLayout()
        //                .isEnable(true)
        //        }
    }
}
