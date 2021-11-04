//
//  AdressRegisterView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 20/10/21.
//

import UIKit


protocol AdressRegisterViewProtocol:AnyObject{
    func actionNextButton()
}

class AdressRegisterView: UIView {

    
     
    weak private var delegate:AdressRegisterViewProtocol?
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text  = "Endereço da Mamãe"
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
    
    
    lazy var districtLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Bairro"
        return label
    }()
    
    lazy var districtTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o bairro da mãe"
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
    
    
    lazy var streetLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Rua(setor, quadra, bloco)"
        return label
    }()
    
    lazy var streetTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite a rua da mãe"
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
    
    lazy var numberLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Número"
        return label
    }()
    
    lazy var numberTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Número"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .numbersAndPunctuation
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 4
        
        return tf
    }()
    
    
    lazy var compLabel:UILabel = {
        let label = UILabel()
//        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Complemento"
        return label
    }()
    
    lazy var compTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Apto/Bloco/Casa"
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
    
    
    lazy var refLabel:UILabel = {
        let label = UILabel()
//        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Ponto de referência"
        return label
    }()
    
    lazy var refTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Insira o ponto de referência"
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
    
    
    lazy var cepLabel:UILabel = {
        let label = UILabel()
//        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "CEP"
        return label
    }()
    
    lazy var cepTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Insira o CEP"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 4
        
        return tf
    }()

    
    lazy var nextButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Continuar", for: .normal)
        btn.clipsToBounds = true
        btn.backgroundColor = .doulaAppPurple
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        btn.layer.cornerRadius = 5.5
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(self.tappednextButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappednextButton(){
        self.delegate?.actionNextButton()
    }
    
    public func setdelegate(delegate:AdressRegisterViewProtocol){
        self.delegate = delegate
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.backgroundColor = .doulaAppGray
        setupViews()
    }
    
    
    public func setupTextFieldDelegate(delegate:UITextFieldDelegate){
        self.districtTextField.delegate = delegate
        self.streetTextField.delegate = delegate
        self.numberTextField.delegate = delegate
        self.compTextField.delegate = delegate
        self.refTextField.delegate = delegate
        self.cepTextField.delegate = delegate
    }
    
    
    public func checkTextField(_ textField:UITextField){
        
        let nameTextField:String = textField.text ?? ""
        
        if !nameTextField.isEmpty{
            setUpButtonEnable(true)
            setTextFieldWarning(textField, warningOn: false)
      
        }else{
            setUpButtonEnable(false)
            setTextFieldWarning(textField, warningOn: true)
        }
    }
    
    private func setUpButtonEnable(_ enable:Bool){
        if enable {
            self.nextButton.setTitleColor(.white, for: .normal)
            self.nextButton.isEnabled = true
        }else{
            self.nextButton.setTitleColor(.lightGray, for: .normal)
            self.nextButton.isEnabled = false
        }
    }
    
    private func setTextFieldWarning(_ textField:UITextField, warningOn:Bool){
        if warningOn{
            textField.layer.borderColor = UIColor.red.cgColor
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }else{
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray.withAlphaComponent(0.7)])
        }
        
    }
    
   
}




extension AdressRegisterView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tipLabel)
        addSubview(districtLabel)
        addSubview(districtTextField)
        addSubview(streetLabel)
        addSubview(streetTextField)
        addSubview(numberLabel)
        addSubview(numberTextField)
        addSubview(compLabel)
        addSubview(compTextField)
        addSubview(refLabel)
        addSubview(refTextField)
        addSubview(cepLabel)
        addSubview(cepTextField)
        addSubview(nextButton)
    }
    
    func setupConstraints() {
        setupTilelabelConstraints()
        setupTiplabelConstraints()
        setupDistrictlabelConstraints()
        setupDistrictTextField()
        setupStreetlabelConstraints()
        setupStreetTextField()
        setupNumberlabelConstraints()
        setupNumberTextField()
        setupComplabelConstraints()
        setupCompTextFieldConstraints()
        setupReflabelConstraints()
        setupReftTextField()
        setupCeplabelConstraints()
        setupCepTextField()
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
    
    private func setupDistrictlabelConstraints(){
        districtLabel.setTopConstraintWith(tipLabel.bottomAnchor, withConstantEqualTo: 35)
        districtLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupDistrictTextField(){
        districtTextField.setTopConstraintWith(districtLabel.bottomAnchor, withConstantEqualTo: 5)
        districtTextField.setLeftConstraint(districtLabel.leftAnchor)
        districtTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        districtTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    
    private func setupStreetlabelConstraints(){
        streetLabel.setTopConstraintWith(districtTextField.bottomAnchor, withConstantEqualTo: 30)
        streetLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupStreetTextField(){
        streetTextField.setTopConstraintWith(streetLabel.bottomAnchor, withConstantEqualTo: 5)
        streetTextField.setLeftConstraint(districtLabel.leftAnchor)
        streetTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        streetTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    private func setupNumberlabelConstraints(){
        numberLabel.setTopConstraintWith(streetTextField.bottomAnchor, withConstantEqualTo: 30)
        numberLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupNumberTextField(){
        numberTextField.setTopConstraintWith(numberLabel.bottomAnchor, withConstantEqualTo: 5)
        numberTextField.setLeftConstraint(districtLabel.leftAnchor)
        numberTextField.setDimeensionsConstraintWith(height: 44,andWithWidth: 130)
    }
    
    
    private func setupComplabelConstraints(){
        compLabel.setTopConstraintWith(streetTextField.bottomAnchor, withConstantEqualTo: 30)
        compLabel.setLeftConstraint(numberTextField.rightAnchor, withConstantEqualTo: 25)
        compLabel.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 10)
    }
    
    private func setupCompTextFieldConstraints(){
        compTextField.setTopConstraintWith(compLabel.bottomAnchor, withConstantEqualTo: 5)
        compTextField.setLeftConstraint(compLabel.leftAnchor)
        compTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        compTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    private func setupReflabelConstraints(){
        refLabel.setTopConstraintWith(compTextField.bottomAnchor, withConstantEqualTo: 30)
        refLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupReftTextField(){
        refTextField.setTopConstraintWith(refLabel.bottomAnchor, withConstantEqualTo: 5)
        refTextField.setLeftConstraint(districtLabel.leftAnchor)
        refTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        refTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    private func setupCeplabelConstraints(){
        cepLabel.setTopConstraintWith(refTextField.bottomAnchor, withConstantEqualTo: 30)
        cepLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupCepTextField(){
        cepTextField.setTopConstraintWith(cepLabel.bottomAnchor, withConstantEqualTo: 5)
        cepTextField.setLeftConstraint(districtLabel.leftAnchor)
        cepTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        cepTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    private func setupNextButtonConstraints(){
        nextButton.setTopConstraintWith(cepTextField.bottomAnchor, withConstantEqualTo: 30)
        nextButton.setRightConstraintWith(cepTextField.rightAnchor)
        nextButton.setLeftConstraint(cepTextField.leftAnchor)
        nextButton.setDimeensionsConstraintWith(height: 44)
        
    }
    
    
    
    
    
    
    
    
    
}
