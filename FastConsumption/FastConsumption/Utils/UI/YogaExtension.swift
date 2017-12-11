//
//  YogaExtension.swift
//  FastConsumption
//
//  Created by  fireFrog on 2017/12/9.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import YogaKit

// MARK: - 给真实的yoga赋上虚拟layout的值
extension UIView {
    func layout(_ layout: VirtualLayout) {
        yoga.isEnabled = layout.isEnabled
        yoga.isIncludedInLayout = layout.isIncludedInLayout
        yoga.direction = layout.direction
        yoga.flexDirection = layout.flexDirection
        yoga.justifyContent = layout.justifyContent
        yoga.alignContent = layout.alignContent
        yoga.alignItems = layout.alignItems
        yoga.alignSelf = layout.alignSelf
        yoga.position = layout.position
        yoga.flexWrap = layout.flexWrap
        yoga.overflow = layout.overflow
        yoga.display = layout.display
        
        yoga.flexGrow = layout.flexGrow
        yoga.flexShrink = layout.flexShrink
        if let flexBasis = layout.flexBasis { yoga.flexBasis = flexBasis }
        
        if let left = layout.left { yoga.left = left }
        
        if let top = layout.top { yoga.top = top }
        if let right = layout.right { yoga.right = right }
        if let bottom = layout.bottom { yoga.bottom = bottom }
        if let start = layout.start { yoga.start = start }
        if let end = layout.end { yoga.end = end }
        
        if let marginLeft = layout.marginLeft { yoga.marginLeft = marginLeft }
        if let marginTop = layout.marginTop { yoga.marginTop = marginTop }
        if let marginRight = layout.marginRight { yoga.marginRight = marginRight }
        if let marginBottom = layout.marginBottom { yoga.marginBottom = marginBottom }
        if let marginStart = layout.marginStart { yoga.marginStart = marginStart }
        if let marginEnd = layout.marginEnd { yoga.marginEnd = marginEnd }
        if let marginHorizontal = layout.marginHorizontal { yoga.marginHorizontal = marginHorizontal }
        if let marginHorizontal = layout.marginHorizontal { yoga.marginHorizontal = marginHorizontal }
        if let marginVertical = layout.marginVertical { yoga.marginVertical = marginVertical }
        if let margin = layout.margin { yoga.margin = margin }

        if let paddingLeft = layout.paddingLeft { yoga.paddingLeft = paddingLeft }
        if let paddingTop = layout.paddingTop { yoga.paddingTop = paddingTop }
        if let paddingRight = layout.paddingRight { yoga.paddingRight = paddingRight }
        if let paddingBottom = layout.paddingBottom { yoga.paddingBottom = paddingBottom }
        if let paddingStart = layout.paddingStart { yoga.paddingStart = paddingStart }
        if let paddingEnd = layout.paddingEnd { yoga.paddingEnd = paddingEnd }
        if let paddingHorizontal = layout.paddingHorizontal { yoga.paddingHorizontal = paddingHorizontal }
        if let paddingVertical = layout.paddingVertical { yoga.paddingVertical = paddingVertical }
        if let padding = layout.padding { yoga.padding = padding }
        
        yoga.borderLeftWidth = layout.borderLeftWidth
        yoga.borderTopWidth = layout.borderTopWidth
        yoga.borderRightWidth = layout.borderRightWidth
        yoga.borderBottomWidth = layout.borderBottomWidth
        yoga.borderStartWidth = layout.borderStartWidth
        yoga.borderEndWidth = layout.borderEndWidth
        yoga.borderWidth = layout.borderWidth
        
        if let width = layout.width { yoga.width = width }
        if let height = layout.height { yoga.height = height }
        if let minWidth = layout.minWidth { yoga.minWidth = minWidth }
        if let minHeight = layout.minHeight { yoga.minHeight = minHeight }
        if let maxWidth = layout.maxWidth { yoga.maxWidth = maxWidth }
        if let maxHeight = layout.maxHeight { yoga.maxHeight = maxHeight }
        
        yoga.aspectRatio = layout.aspectRatio
        
    }
}
//
//private let undefineValue = YGValueUndefined
//private let autoValue = YGValueAuto
private let YOGA = UIView().yoga
private let undefineValue = YGValue(value: 0, unit: YGUnit.undefined)
private let autoValue = YGValue(value: 0, unit: YGUnit.auto)

// MARK: - 建立一个虚拟的layout 用来复用布局
public class VirtualLayout {
    
    var isIncludedInLayout: Bool = YOGA.isIncludedInLayout
    var isEnabled: Bool = YOGA.isEnabled
    
    var direction: YGDirection = YOGA.direction
    var flexDirection: YGFlexDirection = YOGA.flexDirection
    var justifyContent: YGJustify = YOGA.justifyContent
    var alignContent: YGAlign = YOGA.alignContent
    var alignItems: YGAlign = YOGA.alignItems
    var alignSelf: YGAlign = YOGA.alignSelf
    
    var position: YGPositionType = YOGA.position
    var flexWrap: YGWrap = YOGA.flexWrap
    var overflow: YGOverflow = YOGA.overflow
    var display: YGDisplay = YOGA.display
    
    var flexGrow: CGFloat = YOGA.flexGrow
    var flexShrink: CGFloat = YOGA.flexShrink
    var flexBasis: YGValue? = nil
    
    var left: YGValue? = nil
    var top: YGValue? = nil
    var right: YGValue? = nil
    var bottom: YGValue? = nil
    var start: YGValue? = nil
    var end: YGValue? = nil

    var marginLeft: YGValue? = nil
    var marginTop: YGValue? = nil
    var marginRight: YGValue? = nil
    var marginBottom: YGValue? = nil
    var marginStart: YGValue? = nil
    var marginEnd: YGValue? = nil
    var marginHorizontal: YGValue? = nil
    var marginVertical: YGValue? = nil
    var margin: YGValue? = nil

    var paddingLeft: YGValue? = nil
    var paddingTop: YGValue? = nil
    var paddingRight: YGValue? = nil
    var paddingBottom: YGValue? = nil
    var paddingStart: YGValue? = nil
    var paddingEnd: YGValue? = nil
    var paddingHorizontal: YGValue? = nil
    var paddingVertical: YGValue? = nil
    var padding: YGValue? = nil
    
    //内存中全部标记为nan
    var borderLeftWidth : CGFloat = YOGA.borderLeftWidth
    var borderTopWidth : CGFloat = YOGA.borderTopWidth
    var borderRightWidth : CGFloat = YOGA.borderRightWidth
    var borderBottomWidth : CGFloat = YOGA.borderBottomWidth
    var borderStartWidth : CGFloat = YOGA.borderStartWidth
    var borderEndWidth : CGFloat = YOGA.borderEndWidth
    var borderWidth : CGFloat = YOGA.borderWidth
    
    var width: YGValue? = nil
    var height: YGValue? = nil
    var minWidth: YGValue? = nil
    var minHeight: YGValue? = nil
    var maxWidth: YGValue? = nil
    var maxHeight: YGValue? = nil
    
    //内存中标记为nan
    var aspectRatio: CGFloat = YOGA.aspectRatio
}

// MARK: - 让虚拟的layout链式调用
extension VirtualLayout {
    @discardableResult
    public func isIncludedInLayout(_ isIncludedInLayout: Bool) -> VirtualLayout {
        self.isIncludedInLayout = isIncludedInLayout
        return self
    }
    
    @discardableResult
    public func isEnable(_ enabled: Bool) -> VirtualLayout {
        self.isEnabled = enabled
        return self
    }
    
    @discardableResult
    public func direction(_ direction: YGDirection) -> VirtualLayout{
        self.direction = direction
        return self
    }
    
    @discardableResult
    public func flexDirection(_ flexDirection: YGFlexDirection) -> VirtualLayout {
        self.flexDirection = flexDirection
        return self
    }
    
    @discardableResult
    public func justifyContent(_ justifyContent: YGJustify) -> VirtualLayout {
        self.justifyContent = justifyContent
        return self
    }
    
    @discardableResult
    public func alignContent(_ alignContent: YGAlign) -> VirtualLayout {
        self.alignContent = alignContent
        return self
    }
    
    @discardableResult
    public func alignItems(_ alignItems: YGAlign) -> VirtualLayout {
        self.alignItems = alignItems
        return self
    }
    
    @discardableResult
    public func alignSelf(_ alignSelf: YGAlign) -> VirtualLayout {
        self.alignSelf = alignSelf
        return self
    }
    
    @discardableResult
    public func position(_ position: YGPositionType) -> VirtualLayout {
        self.position = position
        return self
    }
    
    @discardableResult
    public func flexWrap(_ flexWrap: YGWrap) -> VirtualLayout {
        self.flexWrap = flexWrap
        return self
    }
    
    @discardableResult
    public func overflow(_ overflow: YGOverflow) -> VirtualLayout {
        self.overflow = overflow
        return self
    }
    
    @discardableResult
    public func display(_ display: YGDisplay) -> VirtualLayout {
        self.display = display
        return self
    }
    
    @discardableResult
    public func flexGrow(_ flexGrow: CGFloat) -> VirtualLayout {
        self.flexGrow = flexGrow
        return self
    }
    
    @discardableResult
    public func flexShrink(_ flexShrink: CGFloat) -> VirtualLayout {
        self.flexShrink = flexShrink
        return self
    }
    
    @discardableResult
    public func flexBasis(_ flexBasis: YGValue) -> VirtualLayout {
        self.flexBasis = flexBasis
        return self
    }
    
    @discardableResult
    public func left(_ left: YGValue) -> VirtualLayout {
        self.left = left
        return self
    }

    @discardableResult
    public func top(_ top: YGValue) -> VirtualLayout {
        self.top = top
        return self
    }

    @discardableResult
    public func right(_ right: YGValue) -> VirtualLayout {
        self.right = right
        return self
    }

    @discardableResult
    public func bottom(_ bottom: YGValue) -> VirtualLayout {
        self.bottom = bottom
        return self
    }

    @discardableResult
    public func start(_ start: YGValue) -> VirtualLayout {
        self.start = start
        return self
    }

    @discardableResult
    public func end(_ end: YGValue) -> VirtualLayout {
        self.end = end
        return self
    }

    @discardableResult
    public func marginLeft(_ marginLeft: YGValue) -> VirtualLayout {
        self.marginLeft = marginLeft
        return self
    }

    @discardableResult
    public func marginTop(_ marginTop: YGValue) -> VirtualLayout {
        self.marginTop = marginTop
        return self
    }

    @discardableResult
    public func marginRight(_ marginRight: YGValue) -> VirtualLayout {
        self.marginRight = marginRight
        return self
    }

    @discardableResult
    public func marginBottom(_ marginBottom: YGValue) -> VirtualLayout {
        self.marginBottom = marginBottom
        return self
    }

    @discardableResult
    public func marginStart(_ marginStart: YGValue) -> VirtualLayout {
        self.marginStart = marginStart
        return self
    }

    @discardableResult
    public func marginEnd(_ marginEnd: YGValue) -> VirtualLayout {
        self.marginEnd = marginEnd
        return self
    }

    @discardableResult
    public func marginHorizontal(_ marginHorizontal: YGValue) -> VirtualLayout {
        self.marginHorizontal = marginHorizontal
        return self
    }

    @discardableResult
    public func marginVertical(_ marginVertical: YGValue) -> VirtualLayout {
        self.marginVertical = marginVertical
        return self
    }

    @discardableResult
    public func margin(_ margin: YGValue) -> VirtualLayout {
        self.margin = margin
        return self
    }

    @discardableResult
    public func paddingLeft(_ paddingLeft: YGValue) -> VirtualLayout {
        self.paddingLeft = paddingLeft
        return self
    }

    @discardableResult
    public func paddingTop(_ paddingTop: YGValue) -> VirtualLayout {
        self.paddingTop = paddingTop
        return self
    }

    @discardableResult
    public func paddingRight(_ paddingRight: YGValue) -> VirtualLayout {
        self.paddingRight = paddingRight
        return self
    }

    @discardableResult
    public func paddingBottom(_ paddingBottom: YGValue) -> VirtualLayout {
        self.paddingBottom = paddingBottom
        return self
    }

    @discardableResult
    public func paddingStart(_ paddingStart: YGValue) -> VirtualLayout {
        self.paddingStart = paddingStart
        return self
    }

    @discardableResult
    public func paddingEnd(_ paddingEnd: YGValue) -> VirtualLayout {
        self.paddingEnd = paddingEnd
        return self
    }

    @discardableResult
    public func paddingHorizontal(_ paddingHorizontal: YGValue) -> VirtualLayout {
        self.paddingHorizontal = paddingHorizontal
        return self
    }

    @discardableResult
    public func paddingVertical(_ paddingVertical: YGValue) -> VirtualLayout {
        self.paddingVertical = paddingVertical
        return self
    }

    @discardableResult
    public func padding(_ padding: YGValue) -> VirtualLayout {
        self.padding = padding
        return self
    }
    
    @discardableResult
    public func borderLeftWidth(_ borderLeftWidth: CGFloat) -> VirtualLayout {
        self.borderLeftWidth = borderLeftWidth
        return self
    }
    
    @discardableResult
    public func borderTopWidth(_ borderTopWidth: CGFloat) -> VirtualLayout {
        self.borderTopWidth = borderTopWidth
        return self
    }
    
    @discardableResult
    public func borderRightWidth(_ borderRightWidth: CGFloat) -> VirtualLayout {
        self.borderRightWidth = borderRightWidth
        return self
    }
    
    @discardableResult
    public func borderBottomWidth(_ borderBottomWidth: CGFloat) -> VirtualLayout {
        self.borderBottomWidth = borderBottomWidth
        return self
    }
    
    @discardableResult
    public func borderStartWidth(_ borderStartWidth: CGFloat) -> VirtualLayout {
        self.borderStartWidth = borderStartWidth
        return self
    }
    
    @discardableResult
    public func borderEndWidth(_ borderEndWidth: CGFloat) -> VirtualLayout {
        self.borderEndWidth = borderEndWidth
        return self
    }
    
    @discardableResult
    public func borderWidth(_ borderWidth: CGFloat) -> VirtualLayout {
        self.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func width(_ width: YGValue) -> VirtualLayout {
        self.width = width
        return self
    }

    @discardableResult
    public func height(_ height: YGValue) -> VirtualLayout {
        self.height = height
        return self
    }

    @discardableResult
    public func minWidth(_ minWidth: YGValue) -> VirtualLayout {
        self.minWidth = minWidth
        return self
    }

    @discardableResult
    public func minHeight(_ minHeight: YGValue) -> VirtualLayout {
        self.minHeight = minHeight
        return self
    }

    @discardableResult
    public func maxWidth(_ maxWidth: YGValue) -> VirtualLayout {
        self.maxWidth = maxWidth
        return self
    }

    @discardableResult
    public func maxHeight(_ maxHeight: YGValue) -> VirtualLayout {
        self.maxHeight = maxHeight
        return self
    }
    
    @discardableResult
    public func aspectRatio(_ aspectRatio: CGFloat) -> VirtualLayout {
        self.aspectRatio = aspectRatio
        return self
    }
}

// MARK: - 用yoga可以链式调用
extension YGLayout {
    @discardableResult
    public func isIncludedInLayout(_ isIncludedInLayout: Bool) -> YGLayout {
        self.isIncludedInLayout = isIncludedInLayout
        return self
    }
    
    @discardableResult
    public func isEnable(_ enabled: Bool) -> YGLayout {
        self.isEnabled = enabled
        return self
    }
    
    @discardableResult
    public func direction(_ direction: YGDirection) -> YGLayout{
        self.direction = direction
        return self
    }
    
    @discardableResult
    public func flexDirection(_ flexDirection: YGFlexDirection) -> YGLayout {
        self.flexDirection = flexDirection
        return self
    }
    
    @discardableResult
    public func justifyContent(_ justifyContent: YGJustify) -> YGLayout {
        self.justifyContent = justifyContent
        return self
    }
    
    @discardableResult
    public func alignContent(_ alignContent: YGAlign) -> YGLayout {
        self.alignContent = alignContent
        return self
    }
    
    @discardableResult
    public func alignItems(_ alignItems: YGAlign) -> YGLayout {
        self.alignItems = alignItems
        return self
    }
    
    @discardableResult
    public func alignSelf(_ alignSelf: YGAlign) -> YGLayout {
        self.alignSelf = alignSelf
        return self
    }
    
    @discardableResult
    public func position(_ position: YGPositionType) -> YGLayout {
        self.position = position
        return self
    }
    
    @discardableResult
    public func flexWrap(_ flexWrap: YGWrap) -> YGLayout {
        self.flexWrap = flexWrap
        return self
    }
    
    @discardableResult
    public func overflow(_ overflow: YGOverflow) -> YGLayout {
        self.overflow = overflow
        return self
    }
    
    @discardableResult
    public func display(_ display: YGDisplay) -> YGLayout {
        self.display = display
        return self
    }
    
    @discardableResult
    public func flexGrow(_ flexGrow: CGFloat) -> YGLayout {
        self.flexGrow = flexGrow
        return self
    }
    
    @discardableResult
    public func flexShrink(_ flexShrink: CGFloat) -> YGLayout {
        self.flexShrink = flexShrink
        return self
    }
    
//    @discardableResult
//    public func flexBasis(_ flexBasis: YGValue) -> YGLayout {
//        self.flexBasis = flexBasis
//        return self
//    }
    
    @discardableResult
    public func left(_ left: YGValue) -> YGLayout {
        self.left = left
        return self
    }
    
    @discardableResult
    public func top(_ top: YGValue) -> YGLayout {
        self.top = top
        return self
    }
    
    @discardableResult
    public func right(_ right: YGValue) -> YGLayout {
        self.right = right
        return self
    }
    
    @discardableResult
    public func bottom(_ bottom: YGValue) -> YGLayout {
        self.bottom = bottom
        return self
    }
    
    @discardableResult
    public func start(_ start: YGValue) -> YGLayout {
        self.start = start
        return self
    }
    
    @discardableResult
    public func end(_ end: YGValue) -> YGLayout {
        self.end = end
        return self
    }
    
    @discardableResult
    public func marginLeft(_ marginLeft: YGValue) -> YGLayout {
        self.marginLeft = marginLeft
        return self
    }
    
    @discardableResult
    public func marginTop(_ marginTop: YGValue) -> YGLayout {
        self.marginTop = marginTop
        return self
    }
    
    @discardableResult
    public func marginRight(_ marginRight: YGValue) -> YGLayout {
        self.marginRight = marginRight
        return self
    }
    
    @discardableResult
    public func marginBottom(_ marginBottom: YGValue) -> YGLayout {
        self.marginBottom = marginBottom
        return self
    }
    
    @discardableResult
    public func marginStart(_ marginStart: YGValue) -> YGLayout {
        self.marginStart = marginStart
        return self
    }
    
    @discardableResult
    public func marginEnd(_ marginEnd: YGValue) -> YGLayout {
        self.marginEnd = marginEnd
        return self
    }
    
    @discardableResult
    public func marginHorizontal(_ marginHorizontal: YGValue) -> YGLayout {
        self.marginHorizontal = marginHorizontal
        return self
    }
    
    @discardableResult
    public func marginVertical(_ marginVertical: YGValue) -> YGLayout {
        self.marginVertical = marginVertical
        return self
    }
    
    @discardableResult
    public func margin(_ margin: YGValue) -> YGLayout {
        self.margin = margin
        return self
    }
    
    @discardableResult
    public func paddingLeft(_ paddingLeft: YGValue) -> YGLayout {
        self.paddingLeft = paddingLeft
        return self
    }
    
    @discardableResult
    public func paddingTop(_ paddingTop: YGValue) -> YGLayout {
        self.paddingTop = paddingTop
        return self
    }
    
    @discardableResult
    public func paddingRight(_ paddingRight: YGValue) -> YGLayout {
        self.paddingRight = paddingRight
        return self
    }
    
    @discardableResult
    public func paddingBottom(_ paddingBottom: YGValue) -> YGLayout {
        self.paddingBottom = paddingBottom
        return self
    }
    
    @discardableResult
    public func paddingStart(_ paddingStart: YGValue) -> YGLayout {
        self.paddingStart = paddingStart
        return self
    }
    
    @discardableResult
    public func paddingEnd(_ paddingEnd: YGValue) -> YGLayout {
        self.paddingEnd = paddingEnd
        return self
    }
    
    @discardableResult
    public func paddingHorizontal(_ paddingHorizontal: YGValue) -> YGLayout {
        self.paddingHorizontal = paddingHorizontal
        return self
    }
    
    @discardableResult
    public func paddingVertical(_ paddingVertical: YGValue) -> YGLayout {
        self.paddingVertical = paddingVertical
        return self
    }
    
    @discardableResult
    public func padding(_ padding: YGValue) -> YGLayout {
        self.padding = padding
        return self
    }
    
    @discardableResult
    public func borderLeftWidth(_ borderLeftWidth: CGFloat) -> YGLayout {
        self.borderLeftWidth = borderLeftWidth
        return self
    }
    
    @discardableResult
    public func borderTopWidth(_ borderTopWidth: CGFloat) -> YGLayout {
        self.borderTopWidth = borderTopWidth
        return self
    }
    
    @discardableResult
    public func borderRightWidth(_ borderRightWidth: CGFloat) -> YGLayout {
        self.borderRightWidth = borderRightWidth
        return self
    }
    
    @discardableResult
    public func borderBottomWidth(_ borderBottomWidth: CGFloat) -> YGLayout {
        self.borderBottomWidth = borderBottomWidth
        return self
    }
    
    @discardableResult
    public func borderStartWidth(_ borderStartWidth: CGFloat) -> YGLayout {
        self.borderStartWidth = borderStartWidth
        return self
    }
    
    @discardableResult
    public func borderEndWidth(_ borderEndWidth: CGFloat) -> YGLayout {
        self.borderEndWidth = borderEndWidth
        return self
    }
    
    @discardableResult
    public func borderWidth(_ borderWidth: CGFloat) -> YGLayout {
        self.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func width(_ width: YGValue) -> YGLayout {
        self.width = width
        return self
    }
    
    @discardableResult
    public func height(_ height: YGValue) -> YGLayout {
        self.height = height
        return self
    }
    
    @discardableResult
    public func minWidth(_ minWidth: YGValue) -> YGLayout {
        self.minWidth = minWidth
        return self
    }
    
    @discardableResult
    public func minHeight(_ minHeight: YGValue) -> YGLayout {
        self.minHeight = minHeight
        return self
    }
    
    @discardableResult
    public func maxWidth(_ maxWidth: YGValue) -> YGLayout {
        self.maxWidth = maxWidth
        return self
    }
    
    @discardableResult
    public func maxHeight(_ maxHeight: YGValue) -> YGLayout {
        self.maxHeight = maxHeight
        return self
    }
    
    @discardableResult
    public func aspectRatio(_ aspectRatio: CGFloat) -> YGLayout {
        self.aspectRatio = aspectRatio
        return self
    }
}



