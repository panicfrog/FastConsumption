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
        let lightingView = UIView()
        lightingView.backgroundColor = .red
        lightingView.layer.cornerRadius = 5
        lightingView.layer.masksToBounds = true
        lightingView.layout(Layout.lightingViewLayout)
        view.addSubview(lightingView)
        
        // 1.2 logo content
        let logoConentView = UIView()
        logoConentView.layout(Layout.logoConentViewLayout)
        view.addSubview(logoConentView)
        
        // 1.2.1 logo 图片
        let logoImageView = UIImageView()
        logoImageView.image = Image.home_logo()
        logoImageView.layout(Layout.logoImageView)
        logoConentView.addSubview(logoImageView)
        
        // 1.2.1 认证按钮
        let myVildeButton = UIButton()
        myVildeButton.layout(Layout.myVildeButtonLayout)
        logoConentView.addSubview(myVildeButton)
        
        let creditlineLabel = UILabel()
        creditlineLabel.layout(Layout.creditlineLabelLayout)
        creditlineLabel.font = UIFont.systemFont(ofSize: 10)
        creditlineLabel.text = "————  信用额度  ————"
        lightingView.addSubview(creditlineLabel)
        
        let quotaLabel = UILabel()
        quotaLabel.layout(Layout.quotaLabelLayout)
        quotaLabel.font = UIFont.systemFont(ofSize: 30)
        lightingView.addSubview(quotaLabel)
        
        let mentionButton = UIButton()
        mentionButton.layout(Layout.mentionButtonLayout)
        mentionButton.setBackgroundImage(Image.home_icon(), for: .normal)
        mentionButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        mentionButton.layer.cornerRadius = 22.scaleHeight
        mentionButton.layer.masksToBounds = true
        mentionButton.layer.borderColor = UIColor(red: 0, green: 112.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        mentionButton.layer.borderWidth = 0.5
        lightingView.addSubview(mentionButton)
        
        let figureImageView = UIImageView()
        figureImageView.layout(Layout.figureImageView)
        lightingView.addSubview(figureImageView)
        
        let figureTipLabel = UILabel()
        figureTipLabel.layout(Layout.figureTipLabel)
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
                .paddingTop(YGValue(13.scaleHeight))
                .aspectRatio(340.0/180.0)
        }
        static var logoImageView: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .height(YGValue(21.scaleHeight))
                .aspectRatio(181.0/44.0)
        }
        static var logoConentViewLayout: VirtualLayout {
            return VirtualLayout()
                .isEnable(true)
                .flexDirection(.row)
                .justifyContent(.spaceAround)
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
