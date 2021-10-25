//
//  AdressVC.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

class BabyRegisterVC: UIViewController {
    
    let context = CoreDataStack.shared.viewContext
    var newBaby:Baby?
    var babyRegisteView:BabyRegisterView?
    var newMom:Mom?
    override func loadView() {
        self.babyRegisteView = BabyRegisterView()
        self.view = babyRegisteView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.babyRegisteView?.setupDelegate(delegate: self)
        self.babyRegisteView?.setuptextfiledDelegate(delegate: self)

        // Do any additional setup after loading the view.
    }
    
    func createBaby(){
        //Create object
        let newBaby = Baby(context: self.context)
        newBaby.name = self.babyRegisteView?.nameTextField.text
        newBaby.christmasCard = self.babyRegisteView?.christmasCard.image?.jpegData(compressionQuality: 0.7)
        newBaby.pregnanceBegin = self.babyRegisteView?.pregnanceStartTextField.text
        
        self.newMom?.baby = newBaby
//        self.context.saveContext()

    }
    
  


}

extension BabyRegisterVC:BabyRegisterViewProtocol{
    func actionNextButton() {
        let adressVc:AdressRegisterViewController = AdressRegisterViewController()
//        babyVC.newMom = self.newMom
        self.createBaby()
        adressVc.newMom = self.newMom
        self.navigationController?.pushViewController(adressVc, animated: true)
    }
    
    func actionCardChristimas() {
        presentPickerView()
    }
    
    private func presentPickerView(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            self.babyRegisteView?.imagePicker.delegate = self
            self.babyRegisteView?.imagePicker.sourceType = .savedPhotosAlbum
            self.babyRegisteView?.imagePicker.allowsEditing = false
        }
        if let picker = self.babyRegisteView?.imagePicker{
            present(picker, animated: true, completion: nil)
        }
    }
    
}

extension BabyRegisterVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.babyRegisteView?.setupCardChristmasImage(pickedImage)
          
          }
        dismiss(animated: true, completion: nil)
    }
}

extension  BabyRegisterVC:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.babyRegisteView?.checkTextField(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}



