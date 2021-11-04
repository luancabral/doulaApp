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
    
    lazy var buttonView:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "plusButton")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    lazy var addMomLabel:UILabel = {
        let label = UILabel()
        label.text = "Cadastrar mãe"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .doulaBlueDark
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
//    lazy var label: UILabel = {
//        
//    }
    
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
        addSubview(buttonView)
        addSubview(addMomLabel)
//        addSubview(bgView)
    }
    
    func setupConstraints() {
//        setupBgViewConstraints()
        setupImageView()
        setupAddLabel()
    }
    
    private func setupBgViewConstraints(){
    
        bgView.setLeftConstraint(leftAnchor)
        bgView.setRightConstraintWith(rightAnchor)
        bgView.setBottomConstraintWith(bottomAnchor)
        bgView.setTopConstraintWith(topAnchor)
    }
    
    private func setupImageView(){
        buttonView.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 60)
        buttonView.setCenterXWith(centerXAnchor)
        buttonView.setDimeensionsConstraintWith(height: 80, andWithWidth: 80)
    }
    
    private func setupAddLabel(){
        addMomLabel.setTopConstraintWith(buttonView.bottomAnchor, withConstantEqualTo: 30)
        addMomLabel.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 5)
        addMomLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 5)
    }
    
}
