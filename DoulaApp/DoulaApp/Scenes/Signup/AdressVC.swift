//
//  AdressVC.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

class AdressVC: UIViewController {

    var adressView:AdressView?
    var teste:Mom?
    override func loadView() {
        self.adressView = AdressView()
        self.view = adressView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
