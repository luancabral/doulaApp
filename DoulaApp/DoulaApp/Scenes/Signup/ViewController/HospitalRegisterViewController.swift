//
//  HospitalRegisterViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 20/10/21.
//

import UIKit

class HospitalRegisterViewController: UIViewController {
    
    var hospitalRegisterView:HospitalRegisterView?
    var newMom:Mom?
    let context = CoreDataStack.shared.viewContext
    
    override func loadView() {
        self.hospitalRegisterView = HospitalRegisterView()
        self.view = hospitalRegisterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hospitalRegisterView?.setupTextFieldDelegate(delegate: self)
        self.hospitalRegisterView?.delegate(delegate: self)
        // Do any additional setup after loading the view.
    }
    
    func createBaby(){
        //Create object
        
        var hospitalOption:[Hospital] = []
        let newHospital = Hospital(context: self.context)
        let newHospital2 = Hospital(context: self.context)
        
        newHospital.name = self.hospitalRegisterView?.nameTextField.text
        newHospital2.name = self.hospitalRegisterView?.name2TextField.text
        
        hospitalOption.append(newHospital)
        hospitalOption.append(newHospital2)
        
        self.newMom?.hospital = NSSet(array: hospitalOption)
//        self.context.saveContext()

    }
    

}

extension HospitalRegisterViewController:HospitalRegisterViewProtocol{
    func actionnextButton() {
        let doctorVC:DoctorRegisterViewController = DoctorRegisterViewController()
        createBaby()
        doctorVC.newMom = self.newMom
        
        self.navigationController?.pushViewController(doctorVC, animated: true)
    }
}

extension HospitalRegisterViewController:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.hospitalRegisterView?.checkTextField(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
