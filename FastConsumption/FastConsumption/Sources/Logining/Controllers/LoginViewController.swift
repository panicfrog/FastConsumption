//
//  LoginViewCorollerViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import Reusable
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, StoryboardSceneBased{
    static let sceneStoryboard = Storyboard.loginingStoryboard()
    
    let bag = DisposeBag()
    
    /// 手机号码输入框
    @IBOutlet weak var phoneTextfield: UITextField!
    /// 密码输入框
    @IBOutlet weak var passwordTextfield: UITextField!
    
    /// 完成去登录按钮
    @IBOutlet weak var commitButton: UIButton!
    /// 忘记密码按钮
    @IBOutlet weak var forgetPasswordButton: UIButton!
    /// 去注册按钮
    @IBOutlet weak var goRegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI()  {
        commitButton.rx.tap
            .subscribe(onNext: {[unowned self] in
                self.dismiss(animated: true, completion: nil)
            })
        .disposed(by: bag)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
