//
//  Hook.swift
//  FastConsumption
//
//  Created by  fireFrog on 2017/12/10.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation

extension NSObject {
    class func getProps() -> [(String,String)] {
        var propertys = [(String,String)]()
        var count:UInt32 = 0
        let props = class_copyPropertyList(self.classForCoder(), &count)
        
        guard props != nil else { return propertys }
        
        for i in 0..<count {
            let prop = props![Int(i)]
            let propName = NSString(cString: property_getName(prop), encoding: String.Encoding.utf8.rawValue)!
            let attributeName = NSString(cString: property_getAttributes(prop)!, encoding: String.Encoding.utf8.rawValue)!
            
            let property = (String(describing: propName),String(describing: attributeName))
            propertys.append(property)
            print("\(property.0), \(property.1)")
        }
        free(props)
        return propertys
    }
    
    
    /**
     获取对象对于的属性值，无对于的属性则返回NIL
     
     - parameter property: 要获取值的属性
     
     - returns: 属性的值
     */
    func getValueOfProperty(property:String) -> AnyObject?{
        let allPropertys = self.getAllPropertys()
        if(allPropertys.contains(property)){
            return self.value(forKey: property) as AnyObject
        }else{
            return nil
        }
    }
    
    /**
     设置对象属性的值
     
     - parameter property: 属性
     - parameter value:    值
     
     - returns: 是否设置成功
     */
    func setValueOfProperty(property:String,value:AnyObject) -> Bool{
        let allPropertys = self.getAllPropertys()
        if(allPropertys.contains(property)){
            self.setValue(value, forKey: property)
            return true
            
        }else{
            return false
        }
    }
    
    /**
     获取对象的所有属性名称
     
     - returns: 属性名称数组
     */
    func getAllPropertys()->[String]{
        
        var result = [String]()
        var count:UInt32 = 0
        let props = class_copyPropertyList(object_getClass(self), &count)
        
        for i in 0..<count {
            let temp = props![Int(i)]
            
            let tempPro = NSString(cString: property_getName(temp), encoding: String.Encoding.utf8.rawValue)!
            let proper = String(describing: tempPro)
            result.append(proper)
        }
        
        return result
    }
    
}
