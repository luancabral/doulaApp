//
//  MomDataView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 22/10/21.
//

import UIKit

class MomDataViewCollectionViewCell: UICollectionViewCell {
    
    
    static var identifier = "MomDataViewCollectionViewCell"
    
    lazy var momlLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .doulaAppPurple
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text  = "Dados da Mãe"
        return label
    }()
   
    
    
    lazy var momImage:UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .doulaAppMain
        view.clipsToBounds = true
        view.layer.cornerRadius = 6.5
        view.layer.borderWidth =  0.5
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.isUserInteractionEnabled = true
        view.image  = UIImage(named: "luan")
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedCardChristmas(_:)))
//        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text  = "Nome:"
        return label
    }()
    
    lazy var nameFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
//        label.text  = ""Não informado")"
        return label
    }()
    
    lazy var rgLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "RG:"
        return label
    }()
    
    lazy var rgFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.text  = "Testando o rg"
        return label
    }()
    
    lazy var cpfLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "CPF:"
        return label
    }()
    
    lazy var cpfFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.text  = "Testando o cpf"
        return label
    }()
    
    lazy var stateLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Estado Civil:"
        return label
    }()
    
    lazy var stateFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.text  = "Testando o estado civil"
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
    
    public func  setupFields(mom:Mom?){
        guard let mom = mom else {
            return
        }
        
        self.nameFieldLabel.text = mom.name
        self.rgFieldLabel.text = mom.rg
        self.cpfFieldLabel.text = mom.cpf
        self.stateFieldLabel.text = mom.state
        
        
    
        
    }

}


extension MomDataViewCollectionViewCell:ViewCodable {
    func setupViewHierarchy() {
        addSubview(momlLabel)
        addSubview(momImage)
        addSubview(nameLabel)
        addSubview(nameFieldLabel)
        addSubview(rgLabel)
        addSubview(rgFieldLabel)
        addSubview(cpfLabel)
        addSubview(cpfFieldLabel)
        addSubview(stateLabel)
        addSubview(stateFieldLabel)
    }
    
    func setupConstraints() {
        setupnameLabelConstraints()
    }
    
    
    private func setupnameLabelConstraints(){
        momlLabel.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 90)
        momlLabel.setCenterXWith(centerXAnchor)

        
        momImage.setTopConstraintWith(momlLabel.bottomAnchor, withConstantEqualTo: 30)
        momImage.setCenterXWith(centerXAnchor)
        momImage.setDimeensionsConstraintWith(height: 110, andWithWidth: 110)


        nameLabel.setTopConstraintWith(momImage.bottomAnchor, withConstantEqualTo: 20)
        nameLabel.setLeftConstraint(safeAreaLayoutGuide.leftAnchor, withConstantEqualTo: 30)
        nameLabel.setDimeensionsConstraintWith(andWithWidth: 100)

        nameFieldLabel.setTopConstraintWith(nameLabel.bottomAnchor, withConstantEqualTo: 5)
        nameFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        nameFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        rgLabel.setTopConstraintWith(nameFieldLabel.bottomAnchor, withConstantEqualTo: 20)
        rgLabel.setLeftConstraint(nameLabel.leftAnchor)
        rgLabel.setDimeensionsConstraintWith(andWithWidth: 100)

        rgFieldLabel.setTopConstraintWith(rgLabel.bottomAnchor, withConstantEqualTo: 5)
        rgFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        rgFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        cpfLabel.setTopConstraintWith(rgFieldLabel.bottomAnchor, withConstantEqualTo: 20)
        cpfLabel.setLeftConstraint(nameLabel.leftAnchor)
        cpfLabel.setDimeensionsConstraintWith(andWithWidth: 100)

        cpfFieldLabel.setTopConstraintWith(cpfLabel.bottomAnchor, withConstantEqualTo: 5)
        cpfFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        cpfFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        stateLabel.setTopConstraintWith(cpfFieldLabel.bottomAnchor, withConstantEqualTo: 20)
        stateLabel.setLeftConstraint(nameLabel.leftAnchor)
        stateLabel.setDimeensionsConstraintWith(andWithWidth: 150)

        stateFieldLabel.setTopConstraintWith(stateLabel.bottomAnchor, withConstantEqualTo: 5)
        stateFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        stateFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        
    }
    
    
    
}
