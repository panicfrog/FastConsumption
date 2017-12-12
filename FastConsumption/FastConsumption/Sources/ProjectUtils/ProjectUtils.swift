//
//  ProjectUtils.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import YYText
import RxCocoa

/// 设置下划线点击富文本
func underLineAttributedString( _ string: String,
                                tapRange: NSRange,
                                action: YYTextAction? ) -> NSMutableAttributedString {
    let text = NSMutableAttributedString(string: string)
    text.yy_font = UIFont.boldSystemFont(ofSize: 14)
    text.yy_color = UIColor.white
    text.yy_setTextUnderline(YYTextDecoration.init(style: .single), range: tapRange)
    
    text.yy_setTextHighlight(tapRange, color: .white, backgroundColor: nil, userInfo: nil, tapAction:action, longPressAction: nil)
    
    return text
}

/// 验证电话号码
func validatePhonoNum(phono: String) -> Bool {
    let phoneNumRegex = "^(?=\\d{11}$)^1(?:3\\d|4[57]|5[^4\\D]|66|7[^249\\D]|8\\d|9[89])\\d{8}$"
    let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneNumRegex)
    return phonePredicate.evaluate(with: phono)
}

/// 验证密码
func validatePassword(passWord: String) -> Bool {
    let passWordRegex = "^[a-zA-Z0-9]{6,20}+$"
    let passWordPredicate = NSPredicate(format: "SELF MATCHES %@", passWordRegex)
    return passWordPredicate.evaluate(with: passWord)
}

/// 验证验证码输入
func validateValidcode(validcode: String) -> Bool {
    let validcodeRegex = "^[0-9]{4}$"
    let validcodePredicate = NSPredicate(format: "SELF MATCHS %@", validcodeRegex)
    return validcodePredicate.evaluate(with: validcode)
}

/// 验证是是否是邮箱
func validateEmailAddress(_ text: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    let testPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return testPredicate.evaluate(with: text)
}

