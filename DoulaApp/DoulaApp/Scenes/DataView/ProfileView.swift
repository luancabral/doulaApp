//
//  ProfileView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 21/10/21.
//

import UIKit

class ProfileView: UIView {
    
    lazy var menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
  
    
    lazy var momProfile:MomDataViewCollectionViewCell = {
        let cv = MomDataViewCollectionViewCell()
        return cv
    }()
  

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        setupViews()
    }
    
    public func setupcollectionViewProtocols(delegate:UICollectionViewDelegate,  datasource:UICollectionViewDataSource){
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = datasource
    }
    
    
}


extension ProfileView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(menuBar)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        setupnameLabelConstraints()
    }
    
    
    private func setupnameLabelConstraints(){
        
        menuBar.setTopConstraintWith(safeAreaLayoutGuide.topAnchor)
        menuBar.setLeftConstraint(leftAnchor)
        menuBar.setRightConstraintWith(rightAnchor)
        menuBar.setDimeensionsConstraintWith(height: 50)
        
        
        collectionView.setTopConstraintWith(menuBar.bottomAnchor)
        collectionView.setRightConstraintWith(rightAnchor)
        collectionView.setLeftConstraint(leftAnchor)
        collectionView.setBottomConstraintWith(bottomAnchor)
        
    }
    
}
