//
//  RegisterViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

///Note : 注意保持UI的纯净性 不要在UI中直接操作与数据相关的内容

import UIKit
import Reusable
import YYText
import RxCocoa
import RxSwift

class RegisterViewController: UIViewController, StoryboardSceneBased {
    static let sceneStoryboard = Storyboard.loginingStoryboard()

    let bag = DisposeBag()
    
    var viewModel: RegisterViewModel!
    
    /// 协议标签
    @IBOutlet weak var agreementLabel: YYLabel!
    
    /// 同意协议按钮
    @IBOutlet weak var checkAgreementButton: UIButton!
    /// 完成提交按钮
    @IBOutlet weak var commitButton: UIButton!
    /// 去登录按钮
    @IBOutlet weak var goLoginButton: UIButton!
    /// 获取验证码按钮
    @IBOutlet weak var validButton: UIButton!
    
    /// 手机号码输入框
    @IBOutlet weak var phoneTextField: UITextField!
    /// 密码输入框
    @IBOutlet weak var passwordTextfield: UITextField!
    /// 验证码输入框
    @IBOutlet weak var validCodeTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI() {
        let agreementText = underLineAttributedString("同意《用户注册及隐私协议》", tapRange: NSRange(location: 2, length: 11)) { (view, text, rang, rect) in
            LogDebug("点击了协议")
        }
        agreementLabel.attributedText = agreementText
        
        checkAgreementButton.rx.tap.subscribe(onNext: { [unowned self] in
            self.viewModel.checkButtonSelected.value = !self.viewModel.checkButtonSelected.value
            })
        .disposed(by: bag)
        
        let checkAgreement = Variable(checkAgreementButton.isSelected).asDriver();
        
        viewModel = RegisterViewModel(
            phone: phoneTextField.rx.text.orEmpty.asDriver(),
            password: passwordTextfield.rx.text.orEmpty.asDriver(),
            validCode: validCodeTextfield.rx.text.orEmpty.asDriver(),
            checkAgreement: checkAgreement
        )
        
        viewModel.phoneValid.drive(onNext: {[unowned self] valid in
            self.phoneTextField.textColor = valid ? .orange : .black
            self.validCodeTextfield.isEnabled = valid
            self.validButton.isEnabled = valid
        }).disposed(by: bag)
        
        viewModel.passwordValid.drive(onNext: {[unowned self] valid in
            self.passwordTextfield.textColor = valid ? .orange : .black
        }).disposed(by: bag)
    
        viewModel.validCodeValid.drive(onNext: {[unowned self] valid in
            self.validCodeTextfield.textColor = valid ? .orange : .black
            self.passwordTextfield.isEnabled = valid
        }).disposed(by: bag)
        
        viewModel.commitButtonEnabled.drive(onNext: {[unowned self] enable in
            self.commitButton.isEnabled = enable
        }).disposed(by: bag)
        
        viewModel.checkButtonSelected.asDriver().drive(onNext: { [unowned self] slected in
            self.checkAgreementButton.isSelected = slected
        }).disposed(by: bag)
        
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
