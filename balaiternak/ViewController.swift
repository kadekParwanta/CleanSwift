//
//  ViewController.swift
//  balaiternak
//
//  Created by Ayu Ratna Wulandari on 13/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import UIKit
import balaiternakPresentation
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

