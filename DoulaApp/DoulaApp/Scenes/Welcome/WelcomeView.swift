//
//  WelcomeView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 01/11/21.
//

import UIKit


protocol WelcomeViewProtocol:AnyObject{
    func saveButtonAction()
}


class WelcomeView: UIView {
    
    
    weak private var delegate:WelcomeViewProtocol?
    
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text  = "Dados da Doula"
        return label
    }()
    
    lazy var tipLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Insira seus dados"
        return label
    }()
    
    
    lazy var doulaNameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Nome completo:"
        return label
    }()
    
    lazy var doulaNameTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite seu nome completo"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 4
        return tf
    }()
    
    
    lazy var doulaSpecialtyLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Especialidade (Opcional):"
        return label
    }()
    
    lazy var doulaSpecialtyTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite sua especialidade"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 4
        return tf
    }()
    
    
    lazy var doulaPhoneLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Contato (Opcional):"
        return label
    }()
    
    lazy var doulaPhoneTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o seu telefone para contato"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 4
        return tf
    }()
    
    
    lazy var doulaMailLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Email (Opcional):"
        return label
    }()
    
    lazy var doulaMailTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o seu email para contato"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 4
        return tf
    }()
    
    lazy var nextButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Salvar", for: .normal)
        btn.clipsToBounds = true
        btn.backgroundColor = .doulaAppPurple
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        btn.layer.cornerRadius = 5.5
        btn.addTarget(self, action: #selector(self.tappedSaveButton), for: .touchUpInside)
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func tappedSaveButton(){
        self.delegate?.saveButtonAction()
    }
    
    
    public func delegate(delegate:WelcomeViewProtocol){
        self.delegate = delegate
    }
    
    
    private func setupUI(){
        self.backgroundColor = .doulaAppGray
        setupViews()
    }
    
    
    public func setupTextFieldDelegate(delegate:UITextFieldDelegate){
        doulaNameTextField.delegate = delegate
        doulaSpecialtyTextField.delegate = delegate
        doulaPhoneTextField.delegate = delegate
        doulaMailTextField.delegate = delegate
    }
    
    
    
}

extension WelcomeView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tipLabel)
        addSubview(doulaNameLabel)
        addSubview(doulaNameTextField)
        addSubview(doulaSpecialtyLabel)
        addSubview(doulaSpecialtyTextField)
        addSubview(doulaPhoneLabel)
        addSubview(doulaPhoneTextField)
        addSubview(doulaMailLabel)
        addSubview(doulaMailTextField)
        addSubview(nextButton)
    }
    
    func setupConstraints() {
        setupTitleLabelConstraints()
        setuptipLabelConstraints()
        setupDoulaNameLabel()
        setupDoulaTextField()
        setupDoulaSpecialityLabel()
        setupDoulaSpecialityTextField()
        setupDoulaPhoneLabel()
        setupDoulaPhoneTextField()
        setupDoulaMailLabel()
        setupDoulaMailTextField()
        setupButtonConstraints()
    }
    
    private func setupTitleLabelConstraints(){
        titleLabel.setCenterXWith(centerXAnchor)
        titleLabel.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 10)
    }
    
    private func setuptipLabelConstraints(){
        tipLabel.setCenterXWith(centerXAnchor)
        tipLabel.setTopConstraintWith(titleLabel.bottomAnchor, withConstantEqualTo: 5)
    }
    
    private func setupDoulaNameLabel(){
        doulaNameLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 20)
        doulaNameLabel.setTopConstraintWith(tipLabel.bottomAnchor, withConstantEqualTo: 30)
    }
    
    private func setupDoulaTextField(){
        doulaNameTextField.setLeftConstraint(doulaNameLabel.leftAnchor)
        doulaNameTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 20)
        doulaNameTextField.setTopConstraintWith(doulaNameLabel.bottomAnchor, withConstantEqualTo: 5)
        doulaNameTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    private func setupDoulaSpecialityLabel(){
        doulaSpecialtyLabel.setTopConstraintWith(doulaNameTextField.bottomAnchor, withConstantEqualTo: 30)
        doulaSpecialtyLabel.setLeftConstraint(doulaNameLabel.leftAnchor)
    }
    
    private func setupDoulaSpecialityTextField(){
        doulaSpecialtyTextField.setLeftConstraint(doulaNameLabel.leftAnchor)
        doulaSpecialtyTextField.setRightConstraintWith(doulaNameTextField.rightAnchor)
        doulaSpecialtyTextField.setTopConstraintWith(doulaSpecialtyLabel.bottomAnchor, withConstantEqualTo: 5)
        doulaSpecialtyTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    private func setupDoulaPhoneLabel(){
        doulaPhoneLabel.setLeftConstraint(doulaNameLabel.leftAnchor)
        doulaPhoneLabel.setTopConstraintWith(doulaSpecialtyTextField.bottomAnchor, withConstantEqualTo: 30)
    }
    
    private func setupDoulaPhoneTextField(){
        doulaPhoneTextField.setLeftConstraint(doulaNameLabel.leftAnchor)
        doulaPhoneTextField.setRightConstraintWith(doulaNameTextField.rightAnchor)
        doulaPhoneTextField.setTopConstraintWith(doulaPhoneLabel.bottomAnchor, withConstantEqualTo: 5)
        doulaPhoneTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    private func setupDoulaMailLabel(){
        doulaMailLabel.setLeftConstraint(doulaNameLabel.leftAnchor)
        doulaMailLabel.setTopConstraintWith(doulaPhoneTextField.bottomAnchor, withConstantEqualTo: 30)
    }
    
    private func setupDoulaMailTextField(){
        doulaMailTextField.setLeftConstraint(doulaNameLabel.leftAnchor)
        doulaMailTextField.setRightConstraintWith(doulaPhoneTextField.rightAnchor)
        doulaMailTextField.setTopConstraintWith(doulaMailLabel.bottomAnchor, withConstantEqualTo: 5)
        doulaMailTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    private func  setupButtonConstraints(){
        nextButton.setTopConstraintWith(doulaMailTextField.bottomAnchor, withConstantEqualTo: 30)
        nextButton.setRightConstraintWith(doulaNameTextField.rightAnchor)
        nextButton.setLeftConstraint(doulaNameTextField.leftAnchor)
        nextButton.setDimeensionsConstraintWith(height: 44)
    }
}
