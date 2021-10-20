//
//  AdressVC.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

class BabyRegisterVC: UIViewController {

    var babyRegisteView:BabyRegisterView?
    var teste:Mom?
    override func loadView() {
        self.babyRegisteView = BabyRegisterView()
        self.view = babyRegisteView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
