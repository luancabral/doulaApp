//
//  ProfileViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 21/10/21.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
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
        self.profileView?.menuBar.delegate(delegate: self)
        setupNote()
        setupNavBar()
        setupToolBar()
      
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        hideToolBar()
    }
    
    
    private func hideToolBar(){
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.toolbar.backgroundColor = .clear
    }
    
    
    
    private func setupNavBar(){
        if let selectedMom = selectedMom {
            self.navigationItem.title = selectedMom.name
            self.profileView?.navExtesion.weeksLabel.text = selectedMom.baby?.weeks
//            self.profileView?.navExtesion.weekLabel = selectedMom.
            self.profileView?.navExtesion.dppLabel.text = "DPP:\(dateToString(date: selectedMom.dpp))"
        }
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.backButtonDisplayMode = .minimal
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    
    private func dateToString(date:Date?) -> String{
//        let  date = self.dateToString(dataString: self.babyRegisteView?.pregnanceStartTextField.text)
        guard let date = date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: date)
    }
    
    
    private func setupNote(){
        self.notes = selectedMom?.notes?.allObjects as? [Note]
        guard let notes = notes else {
            return
        }
        self.notes = notes.sorted(by: {$0.date ?? Date() > $1.date ?? Date()})
    }
    
  
    @objc func writeClick(){
        presentNewNote()
    }
    
    
    private func setupToolBar(){
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.toolbar.backgroundColor = .lightGray
        let writeButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(writeClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        writeButton.tintColor = .white
        self.setToolbarItems([spaceButton,writeButton], animated: false)
    }
    
    private func presentEditNote(row:Int){
        guard let selectedMom = selectedMom else {
            return
        }
        let addNote = AddNoteViewController()
        addNote.setupDelegate(delegate: self)
        addNote.note = self.notes?[row]
        addNote.selectedMom = selectedMom
        self.present(addNote, animated: true, completion: nil)
    }
    
    
    private func presentNewNote(){
        guard let selectedMom = selectedMom else {
            return
        }
        let newNote = AddNoteViewController()
        newNote.setupDelegate(delegate: self)
        newNote.selectedMom = selectedMom
        newNote.notes = self.notes
        self.present(newNote, animated: true, completion: nil)
    }
  
    func scroolToMenuIndex(menuIndex:Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        profileView?.collectionView.isPagingEnabled = false
        profileView?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        profileView?.collectionView.isPagingEnabled = true
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        profileView?.menuBar.horizontalBarLeftAnchor?.constant = scrollView.contentOffset.x/4
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        profileView?.menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
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
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presentEditNote(row: indexPath.row)
    }
}


extension ProfileViewController:AddNoteViewControllerProtocol{
    func updateView() {
        self.setupNote()
        DispatchQueue.main.async {
            self.profileView?.collectionView.reloadData()
        }
    }
    
    
    
}


extension ProfileViewController:MenuBarProtocol{
    func changeCollection(menuIndex: Int) {
        scroolToMenuIndex(menuIndex: menuIndex)
    }
    
    
}
