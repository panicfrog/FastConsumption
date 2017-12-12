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

class ResetPasswordViewController: UIViewController, StoryboardSceneBased {
    static let sceneStoryboard = Storyboard.loginingStoryboard()
    
    let bag = DisposeBag()
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var nextStepButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI()  {
        nextStepButton.rx.tap
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
