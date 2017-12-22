//
//  ViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/4.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import YogaKit
import Moya

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(ScreenWidth)
        print(ScreenHeight)
        
        
        MoyaProvider<LightningAPI>().request(.login(phone: "15180462523", password: "123456")) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(json as Any)
//                let statusCode = moyaResponse.statusCode
            // do something with the response data or statusCode
            case let .failure(error):
                print(error)
            }
        }
       
    }
    @IBAction func push(_ sender: UIButton) {
//        self.present(HomeViewController(), animated: true, completion: nil)
        let drawerViewController = DrawerViewController(side: SideViewController(), bottom: Variable(nil))
        self.present(drawerViewController, animated: true, completion: nil)
    }
    
    
    
}
