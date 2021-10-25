//
//  HomeView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import UIKit


class HomeView:UIView{
    
    lazy var logoImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logoApp")
//        image.backgroundColor = .red
        return image
    }()
    
    
    lazy var welcomeLabel:UILabel = {
        let label = UILabel()
        label.text = "Bem vindo(a)"
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    lazy var doulaLabel:UILabel = {
        let label = UILabel()
        label.text = "Arielle"
        label.textAlignment = .center
        label.textColor = .doulaAppDetails
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var momCollectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: .init())
        collectionView.backgroundColor = .doulaAppMain
        collectionView.clipsToBounds = true
//        collectionView.layer.cornerRadius = 50
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delaysContentTouches = false
    
        collectionView.clipsToBounds = true
        collectionView.layer.cornerRadius = 30
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public func configCollectionViewProtocol(delegate:UICollectionViewDelegate, dataSource:UICollectionViewDataSource){
        self.momCollectionView.delegate = delegate
        self.momCollectionView.dataSource = dataSource
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: View Codable
extension HomeView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(logoImage)
        addSubview(welcomeLabel)
        addSubview(doulaLabel)
        addSubview(momCollectionView)
    }
    
    func setupConstraints() {
        setupLogoImageConstraint()
        setupWelcomeLabelConstraint()
        setupDoulaLabelConstraint()
        setupMomCollectionViewConstraint()
    }
    
    private func setupLogoImageConstraint(){
        logoImage.setLeftConstraint(safeAreaLayoutGuide.leftAnchor)
        logoImage.setTopConstraintWith(safeAreaLayoutGuide.topAnchor)
        logoImage.setDimeensionsConstraintWith(height: 150, andWithWidth: 150)
    }
    
    private func setupWelcomeLabelConstraint(){
        welcomeLabel.setLeftConstraint(logoImage.rightAnchor,withConstantEqualTo: 20)
        welcomeLabel.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 20)
    }
    
    private func setupDoulaLabelConstraint(){
        doulaLabel.setLeftConstraint(welcomeLabel.leftAnchor, withConstantEqualTo: 30)
        doulaLabel.setTopConstraintWith(welcomeLabel.bottomAnchor, withConstantEqualTo: 10)
    }
    
    private func setupMomCollectionViewConstraint(){
        momCollectionView.setLeftConstraint(leftAnchor)
        momCollectionView.setRightConstraintWith(rightAnchor)
        momCollectionView.setBottomConstraintWith(bottomAnchor)
        momCollectionView.setTopConstraintWith(logoImage.bottomAnchor, withConstantEqualTo: 10)
    }
    
}
