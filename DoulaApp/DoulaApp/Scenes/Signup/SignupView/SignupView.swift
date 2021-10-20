//
//  SignupView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

protocol SignupViewProtocol:AnyObject{
    func actionRegisterBtn()
}

class SignupView: UIView {

    weak private var delegate:SignupViewProtocol?
    
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text  = "Dados da Mamãe"
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
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Nome completo"
        return label
    }()
    
    lazy var nameTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o nome da mãe"
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
    
    
    lazy var rgLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "RG"
        return label
    }()
    
    lazy var rgTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o RG"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        return tf
    }()
    
    
    lazy var cpfLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "CPF"
        return label
    }()
    
    lazy var cpfTextField:UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Digite o CPF"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        return tf
    }()
    
    
    lazy var stateLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Estado Civil"
        return label
    }()
    
    
    
    lazy var stateTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Digite o estado civil"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.inputView = genderPickerView
        
        return tf
        
    }()
    
    lazy var genderPickerView:UIPickerView = {
        let picker = UIPickerView()
//        picker.isHidden = true
        return picker
    }()
    
    lazy var nationalityPickerView:UIPickerView = {
        let picker = UIPickerView()
//        picker.isHidden = true
        return picker
    }()
    
    
    lazy var nationalityLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Nacionalidade"
        return label
    }()

    lazy var nationalityTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Digite a nacionalidade"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.autocorrectionType = .no
        tf.keyboardType = .numberPad
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        tf.inputView = nationalityPickerView
        
        return tf
        
    }()
    
    
    lazy var nextButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Continuar", for: .normal)
        btn.clipsToBounds = true
        btn.backgroundColor = .doulaAppMain
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        btn.layer.cornerRadius = 5.5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(self.tappednextButton), for: .touchUpInside)
        return btn
    }()
    
    //MARK: PUT ON UTILS FOLDER
    public func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    @objc func tappednextButton(){
        self.delegate?.actionRegisterBtn()
    }
    
    
    public func delegate(delegate:SignupViewProtocol){
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
        self.rgTextField.delegate = delegate
        self.cpfTextField.delegate = delegate
    }
    
    public func setupPickerDelegate(delegate:UIPickerViewDelegate, dataSource:UIPickerViewDataSource){
        self.genderPickerView.delegate = delegate
        self.genderPickerView.dataSource = dataSource
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


extension SignupView:ViewCodable{
    
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tipLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(rgLabel)
        addSubview(rgTextField)
        addSubview(cpfLabel)
        addSubview(cpfTextField)
        addSubview(stateLabel)
        addSubview(stateTextField)
        addSubview(nextButton)

    }
    
    func setupConstraints() {
        setupTilelabelConstraints()
        setupTiplabelConstraints()
        setupNamelabelConstraints()
        setupNameTextField()
        setupRgLabel()
        setupRgTextField()
        setupCpfLabel()
        setupCpfTextField()
        setupStateabel()
        setupStateTextField()
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
    
    private func setupRgLabel(){
        rgLabel.setTopConstraintWith(nameTextField.bottomAnchor, withConstantEqualTo: 30)
        rgLabel.setLeftConstraint(nameLabel.leftAnchor)
    }
    
    
    private func setupRgTextField(){
        rgTextField.setTopConstraintWith(rgLabel.bottomAnchor, withConstantEqualTo: 5)
        rgTextField.setLeftConstraint(nameLabel.leftAnchor)
        rgTextField.setRightConstraintWith(nameTextField.rightAnchor)
        rgTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    private func setupCpfLabel(){
        cpfLabel.setTopConstraintWith(rgTextField.bottomAnchor, withConstantEqualTo: 30)
        cpfLabel.setLeftConstraint(nameLabel.leftAnchor)
    }
    
    
    private func setupCpfTextField(){
        cpfTextField.setTopConstraintWith(cpfLabel.bottomAnchor, withConstantEqualTo: 5)
        cpfTextField.setLeftConstraint(nameLabel.leftAnchor)
        cpfTextField.setRightConstraintWith(nameTextField.rightAnchor)
        cpfTextField.setDimeensionsConstraintWith(height: 44)
    }
    

    private func setupStateabel(){
        stateLabel.setTopConstraintWith(cpfTextField.bottomAnchor, withConstantEqualTo: 30)
        stateLabel.setLeftConstraint(nameLabel.leftAnchor)
    }


    private func setupStateTextField(){
        stateTextField.setTopConstraintWith(stateLabel.bottomAnchor, withConstantEqualTo: 5)
        stateTextField.setLeftConstraint(nameLabel.leftAnchor)
        stateTextField.setRightConstraintWith(nameTextField.rightAnchor)
        stateTextField.setDimeensionsConstraintWith(height: 44)
    }

    

    
    
    private func setupNextButtonConstraints(){
        nextButton.setTopConstraintWith(stateTextField.bottomAnchor, withConstantEqualTo: 30)
        nextButton.setRightConstraintWith(nameTextField.rightAnchor)
        nextButton.setLeftConstraint(nameTextField.leftAnchor)
        nextButton.setDimeensionsConstraintWith(height: 44)
        
    }
}
