//
//  AdressView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

class BabyRegisterView: UIView {
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text  = "Dados do Bebê"
        return label
    }()
    
    lazy var tipLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Complete os campos abaixo"
        return label
    }()
    
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Nome completo"
        return label
    }()
    
    lazy var nameTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o nome do bebê"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        return tf
    }()
    
    
    lazy var christmasCard:UIView = {
        let view = UIView()
        view.backgroundColor = .doulaAppMain
        view.clipsToBounds = true
        view.layer.cornerRadius = 6.5
        view.layer.borderWidth =  0.5
        view.layer.borderColor = UIColor.darkGray.cgColor
        
        return view
    }()
    
    lazy var christmasCardLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Cartão pré natal"
        return label
    }()
    
    lazy var nextButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Continuar", for: .normal)
        btn.clipsToBounds = true
        btn.backgroundColor = .doulaAppMain
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        btn.layer.cornerRadius = 5.5
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.addTarget(self, action: #selector(self.tappednextButton), for: .touchUpInside)
        return btn
    }()
    
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
       self.backgroundColor = .doulaAppGray
       setupViews()
    }

}



extension BabyRegisterView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tipLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(christmasCard)
        christmasCard.addSubview(christmasCardLabel)
        addSubview(nextButton)
        
    }
    
    func setupConstraints() {
        setupTilelabelConstraints()
        setupTiplabelConstraints()
        setupNamelabelConstraints()
        setupNameTextField()
        setupChristimasCardConstraints()
        setupChristimasCardLabelConstraints()
        setupNextButtonConstraints()
    }
    
    
    
    private func setupTilelabelConstraints(){
        titleLabel.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 10)
        titleLabel.setCenterXWith(centerXAnchor)
    }
    
    private func setupTiplabelConstraints(){
        tipLabel.setTopConstraintWith(titleLabel.bottomAnchor, withConstantEqualTo: 5)
        tipLabel.setCenterXWith(centerXAnchor)
    }
    
    private func setupNamelabelConstraints(){
        nameLabel.setTopConstraintWith(tipLabel.bottomAnchor, withConstantEqualTo: 35)
        nameLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupNameTextField(){
        nameTextField.setTopConstraintWith(nameLabel.bottomAnchor, withConstantEqualTo: 5)
        nameTextField.setLeftConstraint(nameLabel.leftAnchor)
        nameTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        nameTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    private func setupChristimasCardConstraints(){
        christmasCard.setTopConstraintWith(nameTextField.bottomAnchor, withConstantEqualTo: 50)
        christmasCard.setCenterXWith(centerXAnchor)

        christmasCard.setRightConstraintWith(nameLabel.rightAnchor)
        christmasCard.setLeftConstraint(nameLabel.leftAnchor)
        christmasCard.setDimeensionsConstraintWith(height: 180)
        
    }
    
    private func setupChristimasCardLabelConstraints(){
        christmasCardLabel.setCenterXWith(centerXAnchor)
        christmasCardLabel.setCenterYWith(centerYAnchor)
    }
    
    
    private func setupNextButtonConstraints(){
        nextButton.setTopConstraintWith(christmasCard.bottomAnchor, withConstantEqualTo: 40)
       
        nextButton.setRightConstraintWith(nameTextField.rightAnchor)
        nextButton.setLeftConstraint(nameTextField.leftAnchor)
        nextButton.setDimeensionsConstraintWith(height: 44)
    }
}

