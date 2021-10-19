//
//  MomCollectionViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import UIKit

class MomCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "MomCollectionViewCell"
    
    let momCollectionViewCellView:MomCollectionViewCellView = MomCollectionViewCellView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .clear
        setupViews()
    }
    
    public func setupCell(data:UIColor){
        self.momCollectionViewCellView.motherImage.backgroundColor = data
    }
    
    
}


extension MomCollectionViewCell:ViewCodable{
    func setupViewHierarchy() {
        addSubview(momCollectionViewCellView)
    }
    
    func setupConstraints() {
        setupMomCollectionViiewCellView()
    }
    
    
    private func setupMomCollectionViiewCellView(){
        momCollectionViewCellView.setTopConstraintWith(topAnchor)
        momCollectionViewCellView.setBottomConstraintWith(bottomAnchor)
        momCollectionViewCellView.setRightConstraintWith(rightAnchor)
        momCollectionViewCellView.setLeftConstraint(leftAnchor)
    }
}
