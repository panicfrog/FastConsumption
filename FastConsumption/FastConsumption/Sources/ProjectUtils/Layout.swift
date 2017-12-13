//
//  Layout.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/12.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation

public struct Flex {
    static var horAround: VirtualLayout  {
        return VirtualLayout()
        .isEnable(true)
        .flexDirection(.row)
        .justifyContent(.spaceAround)
    }
    
    static var verStart: VirtualLayout {
        return VirtualLayout()
        .isEnable(true)
        .flexDirection(.column)
        .justifyContent(.flexStart)
    }
}
