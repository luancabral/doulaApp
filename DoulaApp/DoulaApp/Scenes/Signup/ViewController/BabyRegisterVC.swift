//
//  AdressVC.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit
import EventKit

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
        newBaby.pregnanceBegin = self.babyRegisteView?.pregnanceStartTextField.text?.toDate()
        newMom?.dpp =  setupDPP(pregrenanceBegin: newBaby.pregnanceBegin)
        self.newMom?.baby = newBaby
        //        self.context.saveContext()
    }
    
    
    private func setupDPP(pregrenanceBegin:Date?) -> Date?{
        var dppDate:String?
        let date = pregrenanceBegin
        let calendar = Calendar.current
        guard let date = date,let beginDate = pregrenanceBegin else {
            return nil
        }
        guard let dppDay = Calendar.current.date(byAdding: .day, value: 7, to: date) else{
            return nil
        }
        
        guard let dppMonth = Calendar.current.date(byAdding: .month, value: -3, to: date) else{
            return nil
        }
        let dayDpp = calendar.dateComponents([.day], from: dppDay)
        let month = calendar.dateComponents([.month], from: dppMonth)
        let dumMonthYear = calendar.dateComponents([.month, .year], from: beginDate)
        
        guard let monthDpp = month.month, let dumMonth = dumMonthYear.month, let dumYear = dumMonthYear.year, let dayDpp = dayDpp.day else {
            return nil
        }
        
        if monthDpp < dumMonth{
            dppDate =  "\(dayDpp)/\(monthDpp)/\(dumYear + 1)"
        }else{
            dppDate = "\(dayDpp)/\(dppMonth)/\(dumYear)"
        }
        
        return dppDate?.toDate()
        
    }
    
    
    
    
    private func setPermission(){
        let eventStore = EKEventStore()
        
        // 2
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(store: eventStore)
        case .denied:
            print("Access denied")
        case .notDetermined:
            // 3
            eventStore.requestAccess(to: .event, completion:
                                        {[weak self] (granted: Bool, error: Error?) -> Void in
                if granted {
                    self?.insertEvent(store: eventStore)
                } else {
                    print("Access denied")
                }
            })
        default:
            print("Case default")
        }
    }
    
    private func insertEvent(store: EKEventStore) {      let event:EKEvent = EKEvent(eventStore: store)
        guard let date = newMom?.dpp else{
            return
        }
        var startDate = date
        startDate.addTimeInterval(5 * 60 * 60)
        // 2 hours
        let endDate = startDate.addingTimeInterval(10 * 60 * 60)
        event.title = "DPP: \(newMom?.name ?? "")"
        event.startDate = startDate
        event.endDate = endDate
        event.notes = "Uma notoca"
        event.calendar = store.defaultCalendarForNewEvents
        do {
            try store.save(event, span: .thisEvent)
            
        } catch let error as NSError {
            print("failed to save event with error : \(error)")
        }
        print("Saved Event")
    }
    
    
    
    
}

extension BabyRegisterVC:BabyRegisterViewProtocol{
    func actionNextButton() {
        self.setPermission()
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



