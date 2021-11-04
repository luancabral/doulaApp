//
//  HospitalRegisterView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 20/10/21.
//

import UIKit

protocol HospitalRegisterViewProtocol:AnyObject{
    func actionnextButton()
}

class HospitalRegisterView: UIView {
    
    weak private var delegate:HospitalRegisterViewProtocol?
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text  = "Hospital Desejado"
        return label
    }()
    
    lazy var tipLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Hospital desejado pela mãe"
        return label
    }()
    
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Nome do hospital desejado - Opção 1"
        return label
    }()
    
    lazy var nameTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o nome do hospital"
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
    
    
    lazy var name2Label:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Nome do hospital desejado - Opção 2"
        return label
    }()
    
    lazy var name2TextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o nome do hospital"
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
        btn.setTitle("Continuar", for: .normal)
        btn.clipsToBounds = true
        btn.backgroundColor = .doulaBlueDark
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        btn.layer.cornerRadius = 5.5
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(self.tappednextbutton), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @objc func tappednextbutton(){
        self.delegate?.actionnextButton()
    }
    

    
    public func delegate(delegate:HospitalRegisterViewProtocol){
        self.delegate = delegate
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
        self.name2TextField.delegate = delegate
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


extension HospitalRegisterView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tipLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(name2Label)
        addSubview(name2TextField)
        addSubview(nextButton)
    }
    
    func setupConstraints() {
        setupTilelabelConstraints()
        setupTiplabelConstraints()
        setupNamelabelConstraints()
        setupNameTextField()
        setupName2labelConstraints()
        setupName2TextField()
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
    
    private func setupName2labelConstraints(){
        name2Label.setTopConstraintWith(nameTextField.bottomAnchor, withConstantEqualTo: 35)
        name2Label.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setupName2TextField(){
        name2TextField.setTopConstraintWith(name2Label.bottomAnchor, withConstantEqualTo: 5)
        name2TextField.setLeftConstraint(nameLabel.leftAnchor)
        name2TextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 30)
        name2TextField.setDimeensionsConstraintWith(height: 44)
    }
    
    private func setupNextButtonConstraints(){
        nextButton.setTopConstraintWith(name2TextField.bottomAnchor, withConstantEqualTo: 30)
        nextButton.setRightConstraintWith(nameTextField.rightAnchor)
        nextButton.setLeftConstraint(nameTextField.leftAnchor)
        nextButton.setDimeensionsConstraintWith(height: 44)
        
    }
    
}
