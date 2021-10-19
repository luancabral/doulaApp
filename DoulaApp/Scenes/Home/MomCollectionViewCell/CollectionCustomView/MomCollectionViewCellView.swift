//
//  MomCollectionViewCellView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import UIKit

class MomCollectionViewCellView: UIView {
    
    
    lazy var bgView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds =  true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var motherImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "luan")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    
    lazy var motherNameLabel:UILabel = {
        let label = UILabel()
        label.text = "Nome da mãe"
        label.textAlignment = .center
        label.textColor = .doulaAppDetails
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var weeksLabel:UILabel = {
        let label = UILabel()
        label.text = "15 semanas"
        label.textAlignment = .center
        label.textColor = .doulaAppDetails
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    lazy var dppLabel:UILabel = {
        let label = UILabel()
        label.text = "25/10/2021"
        label.textAlignment = .center
        label.textColor = .doulaAppDetails
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
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
  
    
}


extension MomCollectionViewCellView:ViewCodable{
    
    func setupViewHierarchy() {
        addSubview(bgView)
        addSubview(motherImage)
        addSubview(motherNameLabel)
        addSubview(weeksLabel)
        addSubview(dppLabel)
    }
    
    func setupConstraints() {
        setupBgViewConstraints()
        setupMotherImageLabelConstraints()
        setupmotherNameLabelConstraints()
        setupWeeksLabelConstraint()
        setupdppLabelConstraints()
    }
    
    
    private func setupBgViewConstraints(){
    
        bgView.setLeftConstraint(leftAnchor)
        bgView.setRightConstraintWith(rightAnchor)
        bgView.setBottomConstraintWith(bottomAnchor)
        bgView.setTopConstraintWith(topAnchor)
    }

    private func setupMotherImageLabelConstraints(){
        motherImage.setCenterXWith(centerXAnchor)
        motherImage.setTopConstraintWith(topAnchor, withConstantEqualTo: 20)
        motherImage.setDimeensionsConstraintWith(height: 80, andWithWidth: 80)
    }
    
    private func setupmotherNameLabelConstraints(){
        motherNameLabel.setTopConstraintWith(motherImage.bottomAnchor, withConstantEqualTo: 30)
        motherNameLabel.setCenterXWith(centerXAnchor)
    }
    
    private func setupWeeksLabelConstraint(){
        weeksLabel.setTopConstraintWith(motherNameLabel.bottomAnchor, withConstantEqualTo: 20)
        weeksLabel.setCenterXWith(centerXAnchor)
    }
    
    private func setupdppLabelConstraints(){
        dppLabel.setTopConstraintWith(weeksLabel.bottomAnchor, withConstantEqualTo: 20)
        dppLabel.setCenterXWith(centerXAnchor)
    }
}


