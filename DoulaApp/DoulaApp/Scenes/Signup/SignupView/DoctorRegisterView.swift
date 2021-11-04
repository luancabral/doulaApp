//
//  HospitalRegisterView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 20/10/21.
//

import UIKit


protocol DoctorRegisterViewProtocol:AnyObject{
    func actionnextbutton()
}

class DoctorRegisterView: UIView {
    
    
    weak private var delegate:DoctorRegisterViewProtocol?
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text  = "Responsável pelo parto "
        return label
    }()
    
    lazy var tipLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Obstetra/enfermeira/parteira"
        return label
    }()
    
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Nome do responsável"
        return label
    }()
    
    lazy var nameTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o nome do responsável"
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
    
    lazy var phoneLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Contato"
        return label
    }()
    
    lazy var phoneTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o contato"
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
        self.delegate?.actionnextbutton()
    }
    
    
    public func delegate(delegate:DoctorRegisterViewProtocol){
        self.delegate = delegate
    }

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
    
    
    public func setupTextFieldDelegate(delegate:UITextFieldDelegate){
        self.nameTextField.delegate = delegate
        self.nameTextField.delegate = delegate
        self.phoneTextField.delegate = delegate
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


extension DoctorRegisterView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tipLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(phoneLabel)
        addSubview(phoneTextField)
        addSubview(nextButton)
    }
    
    func setupConstraints() {
        setupTilelabelConstraints()
        setupTiplabelConstraints()
        setupNamelabelConstraints()
        setupNameTextField()
        setupPhonelabelConstraints()
        setupPhoneTextField()
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
    
    private func setupPhonelabelConstraints(){
        phoneLabel.setTopConstraintWith(nameTextField.bottomAnchor, withConstantEqualTo: 30)
        phoneLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupPhoneTextField(){
        phoneTextField.setTopConstraintWith(phoneLabel.bottomAnchor, withConstantEqualTo: 5)
        phoneTextField.setLeftConstraint(nameLabel.leftAnchor)
        phoneTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        phoneTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    private func setupNextButtonConstraints(){
        nextButton.setTopConstraintWith(phoneTextField.bottomAnchor, withConstantEqualTo: 30)
        nextButton.setRightConstraintWith(nameTextField.rightAnchor)
        nextButton.setLeftConstraint(nameTextField.leftAnchor)
        nextButton.setDimeensionsConstraintWith(height: 44)
        
    }
}
