//
//  ResetPasswordViewController.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa


fileprivate let blue = UIColor(hex: "#198cfb")
class ResetPasswordViewController: UIViewController, StoryboardSceneBased {
    static let sceneStoryboard = Storyboard.loginingStoryboard()
    let bag = DisposeBag()
    
    var viewModel: ResetPasswordViewModel!
    var phoneText: String? = nil
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var nextStepButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        viewModel = ResetPasswordViewModel(password: newPasswordTextField.rx.text.orEmpty.asDriver())
        
        viewModel.passwordValid.drive(onNext: { [unowned self] valid in
            self.nextStepButton.isEnabled = valid
            self.nextStepButton.backgroundColor = valid ? blue : .lightGray
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
