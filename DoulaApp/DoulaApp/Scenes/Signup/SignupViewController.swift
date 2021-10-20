//
//  SignupViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

class SignupViewController: UIViewController {
    let pickerViewData:[String] = ["Solteira", "Casada","Separada","Divorciada", "Viúva"]
    let context = CoreDataStack.shared.viewContext
    var signupView:SignupView?
    var moms:[Mom]?
    
    override func loadView() {
        self.signupView = SignupView()
        self.view = signupView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signupView?.delegate(delegate: self)
        self.signupView?.setupTextFieldDelegate(delegate: self)
        self.signupView?.setupPickerDelegate(delegate: self, dataSource: self)
    }
    
    func fetchPeople(){
        do {
            self.moms = try context.fetch(Mom.fetchRequest())
            //refresh collection with dispatch
        } catch {
            print("Error")
        }
    }
    
    
    func createMom(){
        //Create object
        let newMom = Mom(context: self.context)
        newMom.name = self.signupView?.nameTextField.text
        
        //Save data
        do {
            try  self.context.save()
        } catch {
            print("Error ao salvar")
        }
        
        //Re-fetch
        self.fetchPeople()
    }
}

extension SignupViewController:UITextFieldDelegate{
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField ==  self.signupView?.rgTextField{
            guard let text = textField.text else { return false }
               let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = self.signupView?.format(with: "X.XXX.XXX", phone: newString)
            return false
        }else if textField == self.signupView?.cpfTextField{
            guard let text = textField.text else { return false }
               let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = self.signupView?.format(with: "XXX.XXX.XXX-XX", phone: newString)
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.signupView?.checkTextField(textField)
//        self.createMom()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


extension SignupViewController:UIPickerViewDelegate, UIPickerViewDataSource{
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.signupView?.stateTextField.text = pickerViewData[row]
    }
    
    
}


extension SignupViewController:SignupViewProtocol{
    func actionRegisterBtn() {
        let babyVC:BabyRegisterVC = BabyRegisterVC()
        self.createMom()
        babyVC.teste = self.moms?.last
        
        self.navigationController?.pushViewController(babyVC, animated: true)
    }
    
    
}
