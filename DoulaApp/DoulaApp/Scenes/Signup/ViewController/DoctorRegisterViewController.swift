//
//  HopistalRegisterViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 20/10/21.
//

import UIKit

class DoctorRegisterViewController: UIViewController {
    
    
    var hospitalRegisterView:DoctorRegisterView?
    var newMom:Mom?
    let context = CoreDataStack.shared
    
    
    override func loadView() {
        self.hospitalRegisterView = DoctorRegisterView()
        self.view = hospitalRegisterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hospitalRegisterView?.delegate(delegate: self)
        self.hospitalRegisterView?.setupTextFieldDelegate(delegate: self)
        // Do any additional setup after loading the view.
    }
    
    func createDoctor(){
        let newDoctor:Doctor = Doctor(context: self.context.viewContext)
        
        newDoctor.name = self.hospitalRegisterView?.nameTextField.text
        newDoctor.phone = self.hospitalRegisterView?.phoneTextField.text
        self.newMom?.doctor = newDoctor
        self.context.saveContext()
    }
    
    
}


extension DoctorRegisterViewController:DoctorRegisterViewProtocol{
    func actionnextbutton() {
        let homeVC:HomeVC = HomeVC()
        self.createDoctor()
        show(homeVC, sender: self)
    }
}

extension DoctorRegisterViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField ==  self.hospitalRegisterView?.phoneTextField{
            guard let text = textField.text else { return false }
               let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.format(with: Masks.phone.maskFormat!, phone: newString)
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.hospitalRegisterView?.checkTextField(textField)
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
