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
    
    lazy var navExtesion:NavigationExtension = {
        let nav = NavigationExtension()
        nav.backgroundColor = .white
        return nav
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
        addSubview(navExtesion)
    }
    
    func setupConstraints() {
        setupNavExtesion()
        setupCollectionViewConstraints()
        setupnameLabelConstraints()
    }
    
    
    private func setupnameLabelConstraints(){
        menuBar.setTopConstraintWith(navExtesion.bottomAnchor)
        menuBar.setLeftConstraint(leftAnchor)
        menuBar.setRightConstraintWith(rightAnchor)
        menuBar.setDimeensionsConstraintWith(height: 50)
    }
    
    private func setupCollectionViewConstraints(){
        collectionView.setTopConstraintWith(menuBar.bottomAnchor)
        collectionView.setRightConstraintWith(rightAnchor)
        collectionView.setLeftConstraint(leftAnchor)
        collectionView.setBottomConstraintWith(bottomAnchor)
    }
    
    private func setupNavExtesion(){
        navExtesion.setTopConstraintWith(topAnchor, withConstantEqualTo: 55)
        navExtesion.setRightConstraintWith(rightAnchor)
        navExtesion.setLeftConstraint(leftAnchor)
        navExtesion.setDimeensionsConstraintWith(height: 45)
    }
    
}
