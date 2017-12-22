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
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        Image.arrow_black()
    }
    func setupUI()  {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        viewModel = LoginViewModel(phone: phoneTextfield.rx.text.orEmpty.asDriver(), password: passwordTextfield.rx.text.orEmpty.asDriver())
        
        viewModel.phoneValid
            .drive(onNext: { [unowned self] valid in
               self.phoneTextfield.textColor = valid ? .orange : .black
            })
        .disposed(by: bag)
        
        viewModel.passwordValid
            .drive(onNext: { [unowned self] valid in
                self.passwordTextfield.textColor = valid ? .orange : .black
            })
        .disposed(by: bag)
        
        viewModel.commitButtonEnabled
            .drive(onNext: { [unowned self] valid in
                self.commitButton.isEnabled = valid
            })
        .disposed(by: bag)
        
        viewModel.forgetPasswordButtonEnabled.drive(onNext: { [unowned self] enable in
            self.forgetPasswordButton.isEnabled = enable
        })
        .disposed(by: bag)
        
        viewModel.goRegisterButtonEnabled.drive(onNext: { [unowned self] enable in
            self.goRegisterButton.isEnabled = enable
        })
        .disposed(by: bag)
        
        commitButton.rx.tap.subscribe(onNext: {[unowned self] in
            self.viewModel.login(phone: self.phoneTextfield.text!, password: self.passwordTextfield.text!)
        })
        .disposed(by: bag)
    }

}
