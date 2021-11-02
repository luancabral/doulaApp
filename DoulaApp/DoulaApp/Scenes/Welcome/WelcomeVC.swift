//
//  WelcomeViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 01/11/21.
//

import UIKit
import CoreData

class WelcomeVC: UIViewController {
    
    let context = CoreDataStack.shared
    var welcomeView:WelcomeView?
    var doulaData:Doula?
    
    
    override func loadView() {
        self.welcomeView = WelcomeView()
        self.view = welcomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeView?.delegate(delegate: self)
        self.welcomeView?.setupTextFieldDelegate(delegate: self)
        getDoula()
    }
    
    
    private func saveDoulaData(){
        if let doulaData = doulaData {
            updateDoula(doula: doulaData)
        }else{
            createNewDoula()
        }
        
        context.saveContext()
      
    }
    
    
    func getDoula(){
        
        do {
            self.doulaData = try self.context.viewContext.fetch(Doula.fetchRequest()).first
        } catch  {
            print("")
        }
    
    }
    
    
    func updateDoula(doula:Doula){
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Doula")
        let predicate = NSPredicate(format: "id = '\(doula.id!)'")

        fetchRequest.predicate = predicate

        do {
            let result = try context.viewContext.fetch(fetchRequest)
            if let doulaToUpdate = result.first as? Doula{
                doulaToUpdate.name = welcomeView?.doulaNameTextField.text
                doulaToUpdate.email = welcomeView?.doulaMailTextField.text
                doulaToUpdate.phone = welcomeView?.doulaPhoneTextField.text
            }
        } catch {
            print("Error")
        }
    }
    
    
    private func createNewDoula(){
        let newDoula = Doula(context: context.viewContext)
        newDoula.id = UUID.init()
        newDoula.name = welcomeView?.doulaNameTextField.text
        newDoula.email = welcomeView?.doulaMailTextField.text
        newDoula.phone = welcomeView?.doulaPhoneTextField.text
    }
    
    
}



extension WelcomeVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


extension WelcomeVC:WelcomeViewProtocol{
    
    func saveButtonAction() {
        saveDoulaData()
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
}
