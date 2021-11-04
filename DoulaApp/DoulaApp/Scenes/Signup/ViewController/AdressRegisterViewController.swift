//
//  AdressRegisterViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 20/10/21.
//

import UIKit

class AdressRegisterViewController: UIViewController {
    
    let context = CoreDataStack.shared.viewContext
    var adressRegisterView:AdressRegisterView?
    var newMom:Mom?
    
    override func loadView() {
        self.adressRegisterView = AdressRegisterView()
        self.view = adressRegisterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.adressRegisterView?.setupTextFieldDelegate(delegate: self)
        self.adressRegisterView?.setdelegate(delegate: self)
    }
    
    func createAdress(){
        //Create object
        let newAdress = Adress(context: self.context)
        newAdress.district = self.adressRegisterView?.districtTextField.text
        newAdress.cep = self.adressRegisterView?.cepTextField.text
        newAdress.number = self.adressRegisterView?.numberTextField.text
        newAdress.complement = self.adressRegisterView?.compTextField.text
        newAdress.reference = self.adressRegisterView?.refTextField.text
        newAdress.cep = self.adressRegisterView?.cepTextField.text
        newAdress.street = self.adressRegisterView?.streetTextField.text
        self.newMom?.adress = newAdress
    }
}

extension AdressRegisterViewController:AdressRegisterViewProtocol{
    func actionNextButton() {
        
        let relativeVC:RelativeViewController = RelativeViewController()
        self.createAdress()
        relativeVC.newMom = self.newMom
        self.navigationController?.pushViewController(relativeVC, animated: true)
        
    }
    
    
}


extension AdressRegisterViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField ==  self.adressRegisterView?.cepTextField{
            guard let text = textField.text else { return false }
               let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.format(with: Masks.cep.maskFormat!, phone: newString)
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.adressRegisterView?.checkTextField(textField)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
