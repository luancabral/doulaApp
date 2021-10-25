//
//  HospitalDataCollectionViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 22/10/21.
//

import UIKit

class HospitalDataCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "HospitalDataCollectionViewCell"
    
    lazy var hospitalLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .doulaAppPurple
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text  = "Dados do hospital"
        return label
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text  = "Hospital (Opcão 1):"
        return label
    }()
    
    lazy var nameFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.text  = "Testando o nome"
        return label
    }()
    
    lazy var name2Label:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Hospital (Opcão 2):"
        return label
    }()
    
    lazy var name2FieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var doctorSectionLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .doulaAppPurple
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "Dados do médico"
        return label
    }()
    
    
    lazy var doctorLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Nome do médico"
        return label
    }()
    
    lazy var doctorFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    
    lazy var doctorPhoneLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Contato do médico:"
        return label
    }()
    
    lazy var doctorPhonFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
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
        self.backgroundColor = .white
        setupViews()
    }
    
    public func setupField(hospital:[Hospital]?, doctor:Doctor?){
        guard let hospital = hospital else {
            return
        }
//
        self.nameFieldLabel.text = hospital.first?.name
        self.name2FieldLabel.text = hospital.last?.name
        
        self.doctorFieldLabel.text = doctor?.name
        self.doctorPhonFieldLabel.text = doctor?.phone
    }
    
}


extension HospitalDataCollectionViewCell:ViewCodable{
    func setupViewHierarchy() {
        addSubview(hospitalLabel)
        addSubview(nameLabel)
        addSubview(nameFieldLabel)
        addSubview(name2Label)
        addSubview(name2FieldLabel)
        addSubview(doctorSectionLabel)
        addSubview(doctorLabel)
        addSubview(doctorFieldLabel)
        addSubview(doctorPhoneLabel)
        addSubview(doctorPhonFieldLabel)
    }
    
    func setupConstraints() {
        setupnameLabelConstraints()
    }
    
    
    private func setupnameLabelConstraints(){
        hospitalLabel.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 100)
        hospitalLabel.setCenterXWith(centerXAnchor)

        nameLabel.setTopConstraintWith(hospitalLabel.bottomAnchor, withConstantEqualTo: 20)
        nameLabel.setLeftConstraint(safeAreaLayoutGuide.leftAnchor, withConstantEqualTo: 30)
        nameLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        nameFieldLabel.setTopConstraintWith(nameLabel.bottomAnchor, withConstantEqualTo: 5)
        nameFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        nameFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        name2Label.setTopConstraintWith(nameFieldLabel.bottomAnchor, withConstantEqualTo: 20)
        name2Label.setLeftConstraint(nameLabel.leftAnchor)
        name2Label.setRightConstraintWith(nameLabel.rightAnchor)

        name2FieldLabel.setTopConstraintWith(name2Label.bottomAnchor, withConstantEqualTo: 5)
        name2FieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        name2FieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)
        
        doctorSectionLabel.setTopConstraintWith(name2FieldLabel.bottomAnchor, withConstantEqualTo: 20)
        doctorSectionLabel.setCenterXWith(centerXAnchor)
//        doctorSectionLabel.setLeftConstraint(nameLabel.leftAnchor)
//        doctorSectionLabel.setRightConstraintWith(nameLabel.rightAnchor)

        doctorLabel.setTopConstraintWith(doctorSectionLabel.bottomAnchor, withConstantEqualTo: 20)
        doctorLabel.setLeftConstraint(nameLabel.leftAnchor)
        doctorLabel.setRightConstraintWith(nameLabel.rightAnchor)

        doctorFieldLabel.setTopConstraintWith(doctorLabel.bottomAnchor, withConstantEqualTo: 5)
        doctorFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        doctorFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)
        
        
        doctorPhoneLabel.setTopConstraintWith(doctorFieldLabel.bottomAnchor, withConstantEqualTo: 20)
        doctorPhoneLabel.setLeftConstraint(nameLabel.leftAnchor)
        doctorPhoneLabel.setRightConstraintWith(nameLabel.rightAnchor)

        doctorPhonFieldLabel.setTopConstraintWith(doctorPhoneLabel.bottomAnchor, withConstantEqualTo: 5)
        doctorPhonFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        doctorPhonFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        
    }
    
}
