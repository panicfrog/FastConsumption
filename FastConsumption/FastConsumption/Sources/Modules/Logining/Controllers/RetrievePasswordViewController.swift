//
//  RetrievePasswordViewController.swift
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

class RetrievePasswordViewController: UIViewController, StoryboardSceneBased {
    static let sceneStoryboard = Storyboard.loginingStoryboard()
    let bag = DisposeBag()
    var viewModel: RetrievePasswordViewModel!
    
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var validCodeTextfield: UITextField!
    
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var getValidCodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI()  {
        viewModel = RetrievePasswordViewModel(phone: phoneTextfield.rx.text.orEmpty.asDriver(), validCode: validCodeTextfield.rx.text.orEmpty.asDriver())

        viewModel.phoneValided.drive(onNext: { [unowned self] valid in
            self.phoneTextfield.textColor = valid ? .orange : .black
            self.getValidCodeButton.isEnabled = valid
            self.validCodeTextfield.isEnabled = valid
        })
        .disposed(by: bag)

        viewModel.validCodeValided.drive(onNext: { [unowned self] valid in
            self.validCodeTextfield.textColor = valid ? .orange : .black
            self.nextStepButton.isEnabled = valid
            self.nextStepButton.backgroundColor = valid ?  blue : .lightGray
        })
        .disposed(by: bag)
        
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let info = Segue.retrievePasswordViewController.retrieveToResetPassword(segue: segue)
       info?.destination.phoneText = info?.source.phoneTextfield.text
    }

}
