//
//  AdressView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

protocol BabyRegisterViewProtocol:AnyObject{
    func actionCardChristimas()
    func actionNextButton()
}

class BabyRegisterView: UIView {
    
    weak private var delegate:BabyRegisterViewProtocol?
    
    
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
        tf.layer.cornerRadius = 4
        return tf
    }()
    
    
    lazy var pregnanceStartPickerView:UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.sizeToFit()
        let loc = Locale(identifier: "pt-br")
        picker.locale = loc
//        picker.maximumDate = Date()
        picker.preferredDatePickerStyle = .inline
        return picker
    }()
    
    lazy var pregnanceStartLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.text  = "Inicio da gestação"
        return label
    }()
    
    
    lazy var pregnanceStartTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Digite o estado civil"
        tf.textColor = .darkGray
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.clear.cgColor
        tf.layer.borderWidth = 1.0
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(title:"Pronto",style: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        tf.inputAccessoryView = toolbar
        tf.inputView = pregnanceStartPickerView
        tf.layer.cornerRadius = 4
        return tf
        
    }()
    
    
    lazy var christmasCard:UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .doulaAppMain
        view.clipsToBounds = true
        view.layer.cornerRadius = 6.5
        view.layer.borderWidth =  0.5
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedCardChristmas(_:)))
        view.addGestureRecognizer(tap)
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
        btn.backgroundColor = .doulaAppPurple
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        btn.layer.cornerRadius = 5.5
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(self.tappednextButton), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var imagePicker = UIImagePickerController()
 
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
    
    public func setuptextfiledDelegate(delegate:UITextFieldDelegate){
        self.nameTextField.delegate =  delegate
        self.pregnanceStartTextField.delegate = delegate
    }
    
    @objc func tappednextButton(){
        self.delegate?.actionNextButton()
    }
    
    @objc func tappedCardChristmas(_ sender:UITapGestureRecognizer? = nil){
        self.delegate?.actionCardChristimas()
    }

    public func setupDelegate(delegate:BabyRegisterViewProtocol){
        self.delegate = delegate
    }
    
    
    public func setupCardChristmasImage(_ pickedImage:UIImage){
        christmasCard.contentMode = .scaleAspectFit
        christmasCard.backgroundColor = .clear
        christmasCard.layer.borderWidth = 0
        christmasCardLabel.removeFromSuperview()
        christmasCard.image = pickedImage
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
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        pregnanceStartTextField.text = formatter.string(from: pregnanceStartPickerView.date)
        self.endEditing(true)
    }
    

}



extension BabyRegisterView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tipLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(pregnanceStartLabel)
        addSubview(pregnanceStartTextField)
        addSubview(christmasCard)
        christmasCard.addSubview(christmasCardLabel)
        addSubview(nextButton)
        
    }
    
    func setupConstraints() {
        setupTilelabelConstraints()
        setupTiplabelConstraints()
        setupNamelabelConstraints()
        setupNameTextField()
        setuppregnanceStartLabelConstraints()
        setuppregnanceStartTextFieldConstraints()
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
    
    private func setuppregnanceStartLabelConstraints(){
        pregnanceStartLabel.setTopConstraintWith(nameTextField.bottomAnchor, withConstantEqualTo: 30)
        pregnanceStartLabel.setLeftConstraint(leftAnchor, withConstantEqualTo: 30)
    }
    
    private func setuppregnanceStartTextFieldConstraints(){
        pregnanceStartTextField.setTopConstraintWith(pregnanceStartLabel.bottomAnchor, withConstantEqualTo: 5)
        pregnanceStartTextField.setLeftConstraint(nameTextField.leftAnchor)
        pregnanceStartTextField.setRightConstraintWith(nameTextField.rightAnchor)
        pregnanceStartTextField.setDimeensionsConstraintWith(height: 44)
    }
    
    
    private func setupChristimasCardConstraints(){
        christmasCard.setTopConstraintWith(pregnanceStartTextField.bottomAnchor, withConstantEqualTo: 30)
        christmasCard.setCenterXWith(centerXAnchor)

        christmasCard.setRightConstraintWith(nameLabel.rightAnchor)
        christmasCard.setLeftConstraint(nameLabel.leftAnchor)
        christmasCard.setBottomConstraintWith(nextButton.topAnchor, withConstantEqualTo: 40)
        
    }
    
    private func setupChristimasCardLabelConstraints(){
        christmasCardLabel.setCenterXWith(christmasCard.centerXAnchor)
        christmasCardLabel.setCenterYWith(christmasCard.centerYAnchor)
    }

    
    private func setupNextButtonConstraints(){
        nextButton.setBottomConstraintWith(safeAreaLayoutGuide.bottomAnchor, withConstantEqualTo: 20)
        nextButton.setRightConstraintWith(nameTextField.rightAnchor)
        nextButton.setLeftConstraint(nameTextField.leftAnchor)
        nextButton.setDimeensionsConstraintWith(height: 44)
    }
    
    
   
}

