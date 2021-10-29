//
//  ProfileViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 21/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileView:ProfileView?
    var selectedMom:Mom?
    var notes:[Note]?
    override func loadView() {
        self.profileView = ProfileView()
        self.view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileView?.setupcollectionViewProtocols(delegate: self, datasource: self)
        setupNote()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    
    private func setupNote(){
        self.notes = selectedMom?.notes?.allObjects as? [Note]
    }
    
  
    
  
    
}

extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            self.profileView?.collectionView.register(NotesCollectionViewCell.self, forCellWithReuseIdentifier: NotesCollectionViewCell.identifier)
            let cell:NotesCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: NotesCollectionViewCell.identifier, for: indexPath) as? NotesCollectionViewCell
            cell?.setupTableViewProtocols(delegate: self, dataSource: self)
            cell?.tableView.reloadData()
        
            return cell ?? UICollectionViewCell()
        }
        
        if indexPath.row == 1 {
        
            self.profileView?.collectionView.register(HospitalDataCollectionViewCell.self, forCellWithReuseIdentifier: HospitalDataCollectionViewCell.identifier)
            let cell:HospitalDataCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: HospitalDataCollectionViewCell.identifier, for: indexPath) as? HospitalDataCollectionViewCell
        
            cell?.setupField(hospital: selectedMom?.hospital?.allObjects as? [Hospital], doctor: selectedMom?.doctor)
            return cell ?? UICollectionViewCell()
        }
        
        
        if indexPath.row == 3 {
        
            self.profileView?.collectionView.register(MomDataViewCollectionViewCell.self, forCellWithReuseIdentifier: MomDataViewCollectionViewCell.identifier)
            let cell:MomDataViewCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: MomDataViewCollectionViewCell.identifier, for: indexPath) as? MomDataViewCollectionViewCell
        
            cell?.setupFields(mom: self.selectedMom)
            return cell ?? UICollectionViewCell()
        }
        
       

        self.profileView?.collectionView.register(RelativeDataCollectionViewCell.self, forCellWithReuseIdentifier: RelativeDataCollectionViewCell.identifier)
        
        let cell:RelativeDataCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: RelativeDataCollectionViewCell.identifier, for: indexPath) as? RelativeDataCollectionViewCell
        
        cell?.setupField(relative: self.selectedMom?.people)
        return  cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}


extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NoteTableViewCell? = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell
        
        cell?.setupItems(note: self.notes?[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let addNote = AddNoteViewController()
            addNote.setupDelegate(delegate: self)
            addNote.note = self.notes?[indexPath.row]
            addNote.selectedMom = self.selectedMom
            self.present(addNote, animated: true, completion: nil)
    }
    
    
}


extension ProfileViewController:AddNoteViewControllerProtocol{
    func updateView() {
        DispatchQueue.main.async {
            self.profileView?.collectionView.reloadData()
        }
       
    }
}
