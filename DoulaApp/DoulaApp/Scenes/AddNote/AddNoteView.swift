//
//  AddNoteView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 28/10/21.
//

import UIKit

class AddNoteView: UIView {
    
    
    lazy var titleTextField:UITextField = {
        let tf = UITextField()
        tf.text = "Boa noite"
        tf.textColor = .black
        tf.font = UIFont.systemFont(ofSize: 23)
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var textView:UITextView = {
        let tx = UITextView()
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 10
        tx.font = UIFont.systemFont(ofSize: 16)
        tx.layer.borderWidth = 0.7
        tx.textAlignment = .justified
        tx.layer.borderColor = UIColor.lightGray.cgColor
        return tx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        setupViews()
        self.backgroundColor = .white
    }
    
    
    public func setupTextFieldDelegate(delegate:UITextFieldDelegate){
        self.titleTextField.delegate = delegate
    }
    
}

extension AddNoteView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleTextField)
        addSubview(textView)
    }
    
    func setupConstraints() {
        setupLabelConstraints()
        setupTextViewConstraints()
    }
    
    private func setupLabelConstraints(){
        titleTextField.setLeftConstraint(leftAnchor, withConstantEqualTo: 10)
        titleTextField.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 10)
        titleTextField.setTopConstraintWith(topAnchor, withConstantEqualTo: 20)
        titleTextField.setDimeensionsConstraintWith(height: 30)
    }
    
    
    private func setupTextViewConstraints(){
        textView.setTopConstraintWith(titleTextField.bottomAnchor, withConstantEqualTo: 10)
        textView.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 10)
        textView.setLeftConstraint(leftAnchor, withConstantEqualTo: 10)
        textView.setBottomConstraintWith(bottomAnchor, withConstantEqualTo: 10)
        
    }
    
    
    
}
