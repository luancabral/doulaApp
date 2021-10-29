//
//  AddNoteViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 28/10/21.
//

import UIKit
import CoreData



protocol AddNoteViewControllerProtocol:AnyObject{
    func updateView()
}

class AddNoteViewController: UIViewController {
    
    weak private var delegate:AddNoteViewControllerProtocol?
    var noteView:AddNoteView?
    var note:Note?
    let context = CoreDataStack.shared
    var selectedMom:Mom?
    
    override func loadView() {
        self.noteView = AddNoteView()
        self.view = noteView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Save text
        saveData()
        self.delegate?.updateView()
    }
    
    public func setupDelegate(delegate:AddNoteViewControllerProtocol){
        self.delegate = delegate
    }
    
    
    

    func saveData(){
        
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Note")
        let predicate = NSPredicate(format: "id = '\(self.note?.id ?? UUID.init()))'")

        fetchRequest.predicate = predicate

        do {
            let result = try context.viewContext.fetch(fetchRequest)
            if let objectToUpdate = result.first as? NSManagedObject{
                objectToUpdate.setValue(noteView?.textView.text, forKey: "content")
            }
        } catch {
            print("Error")
            createNewNote()
        }
        
        context.saveContext()
    }
    
    
    func createNewNote(){
        let newNote = Note(context: context.viewContext)
        newNote.id = UUID.init()
        newNote.date = Date()
        newNote.title = noteView?.titleLabel.text
        newNote.content = noteView?.textView.text
        self.selectedMom?.notes?.adding(newNote)
    }
}
