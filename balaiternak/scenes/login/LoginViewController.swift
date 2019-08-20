//
//  LoginViewController.swift
//  balaiternak
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }
    
    func bindViewModel() {
        let input = LoginViewModel.Input(username: txtUsername.rx.text.orEmpty.asObservable(), password: txtPassword.rx.text.orEmpty.asObservable(), submitTrigger: btnSubmit.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        output.dismiss.drive().disposed(by: disposeBag)
        output.fetching.drive {print("fetching...")}
            .disposed(by: disposeBag)
        output.error.drive(errorBinding).disposed(by: disposeBag)
    }
    
    var errorBinding: Binder<Error> {
        return Binder(self, binding: { (vc, err) in
            let alert = UIAlertController(title: "Error",
                                          message: err.localizedDescription,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss",
                                       style: UIAlertAction.Style.cancel,
                                       handler: nil)
            alert.addAction(action)
            vc.present(alert, animated: true, completion: nil)
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
