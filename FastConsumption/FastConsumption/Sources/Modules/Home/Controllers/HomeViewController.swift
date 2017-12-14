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
fileprivate  let backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
fileprivate  let orangeColor = UIColor(red: 255.0/255.0, green: 189.0/255.0, blue: 26.0/255.0, alpha: 1.0)
fileprivate let grayTextColor = UIColor(red: 160.0/255.0, green: 160.0/255.0, blue: 160.0/255.0, alpha: 1.0)
fileprivate  let viewPaddingHor:CGFloat = 14.scaleWidth
fileprivate  let contentViewPadding:CGFloat = 12.scaleWidth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        view.layout(Layout.viewLayou)
        view.backgroundColor = backgroundColor
        view.addSubview(headerBackgroundImageView())
        
        //1 上面的conent view
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.layout(Layout.containerViewLayout)
        view.addSubview(contentView)
        
        //1.1
        contentView.addSubview(headerView())
        
        //1.2 分割线
        let lineImageView = UIImageView()
        lineImageView.layout(Layout.lineImageViewLayout)
        lineImageView.image = Image.home_dotted()
        contentView.addSubview(lineImageView)

        //1.3 选择金额
        let amountView = UIView()
        amountView.layout(Layout.amountViewLayout)
        contentView.addSubview(amountView)
        
        amountView.addSubview(horLastEnd(icon: Image.home_toborrow_icon()!,
                                          text: "借款金额",
                                          tipShow: true,
                                          endString: "￥2500"))
        // 金额滑条
        let quotaSlider = UISlider()
        quotaSlider.layout(Layout.quotaSliderLayout)
        amountView.addSubview(quotaSlider)
        
        // 金额标签
        let valueContentView = horLabelsSpaceBetween(["500元", "5000元"])
        valueContentView.yoga.marginBottom(YGValue(48.5.scaleHeight))
        amountView.addSubview(valueContentView)
        
        amountView.addSubview(horLastEnd(icon: Image.home_borrowingamount_icon()!,
                                         text: "借款期限",
                                         tipShow: false,
                                         endString: "90天"))
        
        let termSlider = UISlider()
        termSlider.layout(Layout.termSliderLayout)
        amountView.addSubview(termSlider)

        let termLabelsContentView = horLabelsSpaceBetween(["90天", "120天", "150天", "180天", "360天"])
        termLabelsContentView.yoga.marginBottom(YGValue(48.5.scaleHeight))
        amountView.addSubview(termLabelsContentView)
        
        //2 下面的按钮
        let loanButton = UIButton()
        loanButton.backgroundColor = quotaColor
        loanButton.layer.cornerRadius = 48.5.scaleHeight/2.0
        loanButton.setTitle("立即借款", for: .normal)
        loanButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.scaleHeight)
        loanButton.setTitleColor(.white, for: .normal)
        loanButton.layout(Layout.loanButtonLayout)
        view.addSubview(loanButton)
        
        view.yoga.applyLayout(preservingOrigin: true)

    }
}

fileprivate struct Layout {
    static var viewLayou: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.column)
            .justifyContent(.flexStart)
            .alignItems(.center)
            .paddingTop(YGValue(27.scaleHeight))
    }
    
    static var containerViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.column)
            .alignItems(.center)
            .width(YGValue(ScreenWidth - 2*viewPaddingHor))
    }
    
    static var contentViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.column)
            .justifyContent(.flexStart)
            .alignItems(.center)
            .width(YGValue(ScreenWidth - 2*viewPaddingHor))
            .paddingTop(YGValue(18.scaleHeight))
            .paddingHorizontal(YGValue(contentViewPadding))
    }
    
    static var logoContentViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .width(YGValue(ScreenWidth-2*(contentViewPadding + viewPaddingHor)))
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
            .marginRight(YGValue(-2*contentViewPadding.scaleWidth))
            .aspectRatio(212.0/65.0)
    }
    
    
    static var loanTipLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginTop(YGValue(22.5.scaleHeight))
    }
    
    static var quotaLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginTop(YGValue(16.scaleHeight))
            .flexDirection(.row)
            .alignItems(.flexEnd)
    }
    
    static var lineImageViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginTop(YGValue(53.scaleHeight))
            .height(YGValue(2.scaleHeight))
            .width(YGValue(ScreenWidth - 2*(viewPaddingHor + contentViewPadding)))
    }
    
    static var amountViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.column)
            .width(YGValue(ScreenWidth-2*(viewPaddingHor)))
            .paddingHorizontal(YGValue(contentViewPadding))
            .paddingTop(30)
    }
    
    static var quotaIconImageViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .width(YGValue(25.scaleWidth))
            .aspectRatio(52.0/48.0)
    }
    
    static var quotaContentViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .height(24)
            .marginLeft(YGValue(10.scaleWidth))
    }
    
    static var amoutLoanLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginLeft(YGValue(10.scaleWidth))
    }
    
    static var numberLabelLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .position(.absolute)
            .rightBottom(x: 0, y: 0)
            .height(24)
    }

    static var amoutMentionButtonLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginLeft(YGValue(7.scaleWidth))
    }
    
    
    static var loanedContentViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .width(YGValue(ScreenWidth-2*(contentViewPadding + viewPaddingHor)))
            .height(24)
            .alignItems(.flexEnd)
    }
    
    static var quotaSliderLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginTop(YGValue(22.scaleHeight))
        
    }
    
    static var quotaValueContentViewLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .flexDirection(.row)
            .justifyContent(.spaceBetween)
            .height(YGValue(11.5.scaleHeight))
            .marginTop(YGValue(8.5.scaleHeight))
    }
    
    static var baseLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
    }
    
    static var termSliderLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .marginTop(YGValue(22.scaleHeight))
    }
    
    static var loanButtonLayout: VirtualLayout {
        return VirtualLayout()
            .isEnable(true)
            .height(YGValue(48.5.scaleHeight))
            .aspectRatio(260.0/48.5)
            .marginTop(YGValue(19.5.scaleHeight))
    }
    
}


func headerBackgroundImageView() -> UIImageView {
    
    let headerImageView = UIImageView()
    headerImageView.yoga.isIncludedInLayout = false
    headerImageView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenWidth/375.0*247.5)
    headerImageView.image = Image.home_bg()
    return headerImageView
}

func headerView() -> UIView {
    // contentView
    let contentView = UIView()
    contentView.layout(Layout.contentViewLayout)
    
    //1 logoContentView
    let logoContentView = UIView()
    logoContentView.layout(Layout.logoContentViewLayout)
    contentView.addSubview(logoContentView)
    
    //1.1.1 logo
    let logoImageView = UIImageView()
    logoImageView.image = Image.home_logo()
    logoImageView.layout(Layout.logoImageViewLayout)
    logoContentView.addSubview(logoImageView)
    
    //1.1.2 认证按钮
    let validButton = UIButton()
    validButton.layout(Layout.validButtonLayout)
    validButton.setImage(Image.home_icon(), for: .normal)
    logoContentView.addSubview(validButton)
    
    //1.2 额度提示标签
    let loanTipLabel = UILabel()
    loanTipLabel.layout(Layout.loanTipLabelLayout)
    loanTipLabel.text = "——   最高可借   ——"
    loanTipLabel.font = UIFont.systemFont(ofSize: 13.scaleHeight)
    loanTipLabel.textColor = textColor
    contentView.addSubview(loanTipLabel)
    
    //1.3 额度标签
    let quotaLabel = UILabel()
    quotaLabel.layout(Layout.quotaLabelLayout)
    quotaLabel.font = UIFont.systemFont(ofSize: 40.scaleHeight)
    quotaLabel.text = "￥5000"
    quotaLabel.textColor = quotaColor
    contentView.addSubview(quotaLabel)
    
    return contentView
}

func horLastEnd(icon: UIImage, text: String, tipShow: Bool, endString: String) -> UIView {
    
    //1.3.1
    let quotaContentView = UIView()
    quotaContentView.layout(Layout.quotaContentViewLayout)
    
    //1.3.2
    let quotaIconImageView = UIImageView()
    quotaIconImageView.layout(Layout.quotaIconImageViewLayout)
    quotaIconImageView.image = icon
    quotaContentView.addSubview(quotaIconImageView)
    
    //1.3.3
    let amoutLoanLabel = UILabel()
    amoutLoanLabel.layout(Layout.amoutLoanLabelLayout)
    amoutLoanLabel.font = UIFont.systemFont(ofSize: 16.scaleHeight)
    amoutLoanLabel.text = text
    quotaContentView.addSubview(amoutLoanLabel)
    
    if tipShow {
        //1.3.4 255,189,26
        let amoutMentionButton = UIButton()
        amoutMentionButton.layout(Layout.amoutMentionButtonLayout)
        amoutMentionButton.setTitle("如何提款", for: .normal)
        amoutMentionButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.scaleHeight)
        amoutMentionButton.setTitleColor(orangeColor, for: .normal)
        quotaContentView.addSubview(amoutMentionButton)
    }
    
    let numberLabel = UILabel()
    numberLabel.layout(Layout.numberLabelLayout)
    numberLabel.text = endString
    numberLabel.font = UIFont.systemFont(ofSize: 25.scaleHeight)
    numberLabel.sizeToFit()
    numberLabel.textColor = quotaColor
    quotaContentView.addSubview(numberLabel)
    
    return quotaContentView;
    
}

func horLabelsSpaceBetween(_ labels:[String]) -> UIView {
    
    let quotaValueContentView = UIView()
    quotaValueContentView.layout(Layout.quotaValueContentViewLayout)
    
    labels.forEach { label in
        let minLabel = UILabel()
        minLabel.layout(Layout.baseLayout)
        minLabel.text = label
        minLabel.font = UIFont.systemFont(ofSize: 13.scaleHeight)
        minLabel.textColor = grayTextColor
        quotaValueContentView.addSubview(minLabel)
    }
    
    return quotaValueContentView
}
