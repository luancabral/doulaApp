//
//  MenuBar.swift
//  DoulaApp
//
//  Created by Luan Cabral on 21/10/21.
//

import UIKit

class MenuBar: UIView {
    
    let barIconName = ["pencil.circle.fill","building.2.crop.circle.fill","heart.circle.fill","person.crop.circle.fill"]
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.register(MenuCellCollectionViewCell.self, forCellWithReuseIdentifier: MenuCellCollectionViewCell.identifier)
        cv.contentInset =  UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        let selectedInexPath = IndexPath(item: 0, section: 0)
        cv.selectItem(at: selectedInexPath, animated: false, scrollPosition: [])
        return cv
    }()
    
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .red
        setupViews()
    }
}

extension MenuBar:ViewCodable {
    func setupViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        setupCollectionViewConstraints()
    }
    
    private func setupCollectionViewConstraints(){
        collectionView.setTopConstraintWith(topAnchor)
        collectionView.setBottomConstraintWith(bottomAnchor)
        collectionView.setLeftConstraint(leftAnchor)
        collectionView.setRightConstraintWith(rightAnchor)
    }
}


extension MenuBar:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MenuCellCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCellCollectionViewCell.identifier, for: indexPath) as? MenuCellCollectionViewCell
        cell?.imageView.image  = UIImage(systemName: barIconName[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    
}
