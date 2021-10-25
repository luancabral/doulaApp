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
    override func loadView() {
        self.profileView = ProfileView()
        self.view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileView?.setupcollectionViewProtocols(delegate: self, datasource: self)
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
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
        
            return cell ?? UICollectionViewCell()
        }
        
        
        if indexPath.row == 3 {
        
            self.profileView?.collectionView.register(MomDataViewCollectionViewCell.self, forCellWithReuseIdentifier: MomDataViewCollectionViewCell.identifier)
            let cell:MomDataViewCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: MomDataViewCollectionViewCell.identifier, for: indexPath) as? MomDataViewCollectionViewCell
        
            cell?.setupFields(mom: self.selectedMom)
            return cell ?? UICollectionViewCell()
        }
        
        if indexPath.row == 1 {
        
            self.profileView?.collectionView.register(HospitalDataCollectionViewCell.self, forCellWithReuseIdentifier: HospitalDataCollectionViewCell.identifier)
            let cell:HospitalDataCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: HospitalDataCollectionViewCell.identifier, for: indexPath) as? HospitalDataCollectionViewCell
        
            cell?.setupField(hospital: selectedMom?.hospital?.allObjects as? [Hospital], doctor: selectedMom?.doctor)
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
