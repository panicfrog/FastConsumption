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
        yoga.flexBasis = layout.flexBasis
        
        yoga.left = layout.left
        yoga.top = layout.top
        yoga.right = layout.right
        yoga.bottom = layout.bottom
        yoga.start = layout.start
        yoga.end = layout.end
        
        yoga.marginLeft = layout.marginLeft
        yoga.marginTop = layout.marginTop
        yoga.marginRight = layout.marginRight
        yoga.marginBottom = layout.marginBottom
        yoga.marginStart = layout.marginStart
        yoga.marginEnd = layout.marginEnd
        yoga.marginHorizontal = layout.marginHorizontal
        yoga.marginVertical = layout.marginVertical
        yoga.margin = layout.margin
        
        yoga.paddingLeft = layout.paddingLeft
        yoga.paddingTop = layout.paddingTop
        yoga.paddingRight = layout.paddingRight
        yoga.paddingBottom = layout.paddingBottom
        yoga.paddingStart = layout.paddingStart
        yoga.paddingEnd = layout.paddingEnd
        yoga.paddingHorizontal = layout.paddingHorizontal
        yoga.paddingVertical = layout.paddingVertical
        yoga.padding = layout.padding
        
        yoga.borderLeftWidth = layout.borderLeftWidth
        yoga.borderTopWidth = layout.borderTopWidth
        yoga.borderRightWidth = layout.borderRightWidth
        yoga.borderBottomWidth = layout.borderBottomWidth
        yoga.borderStartWidth = layout.borderStartWidth
        yoga.borderEndWidth = layout.borderEndWidth
        yoga.borderWidth = layout.borderWidth
        
        yoga.width = layout.width
        yoga.height = layout.height
        yoga.minWidth = layout.minWidth
        yoga.minHeight = layout.minHeight
        yoga.maxWidth = layout.maxWidth
        yoga.maxHeight = layout.maxHeight
        
        yoga.aspectRatio = layout.aspectRatio
        
    }
}
//
//private let undefineValue = YGValueUndefined
//private let autoValue = YGValueAuto

private let undefineValue = YGValue(value: 0, unit: YGUnit.undefined)
private let autoValue = YGValue(value: 0, unit: YGUnit.auto)

// MARK: - 建立一个虚拟的layout 用来复用布局
public class VirtualLayout {
    
    var isIncludedInLayout: Bool = true
    var isEnabled: Bool = false
    
    var direction: YGDirection = .inherit
    var flexDirection: YGFlexDirection = .column
    var justifyContent: YGJustify = .flexStart
    var alignContent: YGAlign = .flexStart
    var alignItems: YGAlign = .flexEnd
    var alignSelf: YGAlign = .auto
    
    var position: YGPositionType = .relative
    var flexWrap: YGWrap = .noWrap
    var overflow: YGOverflow = .visible
    var display: YGDisplay = .flex
    
    var flexGrow: CGFloat = 0
    var flexShrink: CGFloat = 0
    var flexBasis: YGValue = autoValue
    
    var left: YGValue = undefineValue
    var top: YGValue = undefineValue
    var right: YGValue = undefineValue
    var bottom: YGValue = undefineValue
    var start: YGValue = undefineValue
    var end: YGValue = undefineValue

    var marginLeft: YGValue = undefineValue
    var marginTop: YGValue = undefineValue
    var marginRight: YGValue = undefineValue
    var marginBottom: YGValue = undefineValue
    var marginStart: YGValue = undefineValue
    var marginEnd: YGValue = undefineValue
    var marginHorizontal: YGValue = undefineValue
    var marginVertical: YGValue = undefineValue
    var margin: YGValue = undefineValue

    var paddingLeft: YGValue = undefineValue
    var paddingTop: YGValue = undefineValue
    var paddingRight: YGValue = undefineValue
    var paddingBottom: YGValue = undefineValue
    var paddingStart: YGValue = undefineValue
    var paddingEnd: YGValue = undefineValue
    var paddingHorizontal: YGValue = undefineValue
    var paddingVertical: YGValue = undefineValue
    var padding: YGValue = undefineValue
    
    //内存中全部标记为nan
    var borderLeftWidth : CGFloat = 0
    var borderTopWidth : CGFloat = 0
    var borderRightWidth : CGFloat = 0
    var borderBottomWidth : CGFloat = 0
    var borderStartWidth : CGFloat = 0
    var borderEndWidth : CGFloat = 0
    var borderWidth : CGFloat = 0
    
    var width: YGValue = autoValue
    var height: YGValue = autoValue
    var minWidth: YGValue = undefineValue
    var minHeight: YGValue = undefineValue
    var maxWidth: YGValue = undefineValue
    var maxHeight: YGValue = undefineValue
    
    //内存中标记为nan
    var aspectRatio: CGFloat = 0
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
    
    @discardableResult
    public func flexBasis(_ flexBasis: YGValue) -> YGLayout {
        self.flexBasis = flexBasis
        return self
    }
    
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



