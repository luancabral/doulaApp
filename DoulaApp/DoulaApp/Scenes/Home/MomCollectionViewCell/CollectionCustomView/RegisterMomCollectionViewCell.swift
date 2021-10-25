//
//  RegisterMomCollectionViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 22/10/21.
//

import UIKit

class RegisterMomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RegisterMomCollectionViewCell"
    
    lazy var bgView:UIView = {
        let view = UIView()
        view.backgroundColor = .doulaAppDetails
        view.clipsToBounds =  true
        view.layer.cornerRadius = 15
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        setupViews()
    }
}


extension RegisterMomCollectionViewCell:ViewCodable{
    func setupViewHierarchy() {
        addSubview(bgView)
    }
    
    func setupConstraints() {
        setupBgViewConstraints()
    }
    
    private func setupBgViewConstraints(){
    
        bgView.setLeftConstraint(leftAnchor)
        bgView.setRightConstraintWith(rightAnchor)
        bgView.setBottomConstraintWith(bottomAnchor)
        bgView.setTopConstraintWith(topAnchor)
    }
    
}
