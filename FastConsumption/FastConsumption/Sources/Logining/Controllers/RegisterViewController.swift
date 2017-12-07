//
//  RegisterViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import Reusable
import YYText
import RxCocoa
import RxSwift

class RegisterViewController: UIViewController, StoryboardSceneBased {
    static let sceneStoryboard = Storyboard.loginingStoryboard()

    let bag = DisposeBag()
    
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
