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
    var notes:[Note]?
    let context = CoreDataStack.shared
    var selectedMom:Mom?

    

    override func loadView() {
        self.noteView = AddNoteView()
        self.view = noteView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteView?.textView.text = note?.content
        self.noteView?.setupTextFieldDelegate(delegate: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Save text
        saveData()
        self.delegate?.updateView()
    }
    
    public func setupDelegate(delegate:AddNoteViewControllerProtocol){
        self.delegate = delegate
    }
    
    

    private func saveData(){
        if (noteView?.textView.text.isEmpty ?? true){
            return
        }

        if let note = note{
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Note")
            let predicate = NSPredicate(format: "id = '\(note.id ?? UUID.init())'")

            fetchRequest.predicate = predicate

            do {
                let result = try context.viewContext.fetch(fetchRequest)
                if let noteToUpdate = result.first as? NSManagedObject{
                    editNote(note: noteToUpdate)
                }
            } catch {
                print("Error")
            }
        }else{
            self.createNewNote()
        }
        context.saveContext()
    }
    
    
    private func saveNotesToMom(newNote:Note){
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Mom")
        let predicate = NSPredicate(format: "id = '\(selectedMom?.id ?? UUID.init())'")

        fetchRequest.predicate = predicate

        do {
            let result = try context.viewContext.fetch(fetchRequest)
            if let momToUpdate = result.first as? Mom{
                momToUpdate.addToNotes(newNote)
            }
        } catch {
            print("Error")
        }
    }
    
  
    
    private func createNewNote(){
        let newNote = Note(context: context.viewContext)
        newNote.id = UUID.init()
        newNote.date = Date()
        newNote.title = noteView?.titleTextField.text
        newNote.content = noteView?.textView.text
        saveNotesToMom(newNote: newNote)
    }
    
    
    
    
    private func editNote(note:NSManagedObject){
        note.setValue(noteView?.textView.text, forKey: "content")
        note.setValue(noteView?.titleTextField.text, forKey: "title")
    }
}


extension AddNoteViewController:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
