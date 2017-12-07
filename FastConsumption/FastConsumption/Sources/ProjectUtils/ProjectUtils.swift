//
//  ProjectUtils.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import YYText

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




