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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pickerType: UIPickerView!
    let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        Observable.just(["LPPM", "Facilitator", "Breeder"])
            .bind(to: pickerType.rx.itemTitles) { _, item in
                return item
            }
            .disposed(by: disposeBag)
        let type = pickerType.rx.itemSelected.map { (row: Int, component: Int) in
            return row + 1
        }
        let input = LoginViewModel.Input(username: txtUsername.rx.text.orEmpty.asDriver(), password: txtPassword.rx.text.orEmpty.asDriver(), type: type.asDriver(onErrorJustReturn: 1), submitTrigger: btnSubmit.rx.tap.asDriver())
        
        let output = viewModel.transform(input: input)
        output.signedIn
            .drive(onNext: { signedIn in
                print("User signed in \(signedIn)")
            }).disposed(by: disposeBag)
        output.fetching
            .drive(onNext: { [weak self] isFetching in
                if isFetching {
                    self?.activityIndicator.startAnimating()
                    self?.activityIndicator.isHidden = false
                } else {
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                }
                
            })
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
