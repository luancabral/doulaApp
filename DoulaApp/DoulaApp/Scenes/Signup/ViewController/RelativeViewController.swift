//
//  RelativeViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 20/10/21.
//

import UIKit

class RelativeViewController: UIViewController {
    
    let pickerViewData:[String] = ["Pai","Mãe","Côjuge","Irmã(o)","Primo(a)","Tio(a)","Avô/Avó"]
    var relativeRegiterView:RelativeRegisterView?
    var newMom:Mom?
    let context = CoreDataStack.shared.viewContext
    
    override func loadView() {
        self.relativeRegiterView = RelativeRegisterView()
        self.view = relativeRegiterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.relativeRegiterView?.delegate(delegate: self)
        self.relativeRegiterView?.setupPickerViewProtocols(delegate: self, datasource: self)
        self.relativeRegiterView?.setupTextFieldDelegate(delegate: self)
        
        // Do any additional setup after loading the view.
    }
    
    func createRelative(){
        //Create object
        let relative = Relative(context: context)
        relative.name = self.relativeRegiterView?.nameTextField.text
        relative.phone = self.relativeRegiterView?.phoneTextField.text
        relative.kinship = self.relativeRegiterView?.relationTextField.text
        
        //Save data
        self.newMom?.people = relative
//        self.context.saveContext()
    }
    

}


extension RelativeViewController:RelativeRegisterViewProtocol{
    func actionnextButton() {
        self.createRelative()
        let hospitalVC:HospitalRegisterViewController = HospitalRegisterViewController()
        hospitalVC.newMom = self.newMom
        self.navigationController?.pushViewController(hospitalVC, animated: true)
    }
    
    
}


extension RelativeViewController:UITextFieldDelegate{
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField ==  self.relativeRegiterView?.phoneTextField{
            guard let text = textField.text else { return false }
               let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.format(with: Masks.phone.maskFormat!, phone: newString)
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.relativeRegiterView?.checkTextField(textField)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


extension RelativeViewController:UIPickerViewDelegate,UIPickerViewDataSource{
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
        self.relativeRegiterView?.relationTextField.text = pickerViewData[row]
    }
    
    
    
}
