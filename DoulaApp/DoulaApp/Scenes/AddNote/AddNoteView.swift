//
//  AddNoteView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 28/10/21.
//

import UIKit

class AddNoteView: UIView {
    
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Boa noite"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    lazy var textView:UITextView = {
        let tx = UITextView()
        tx.clipsToBounds = true
        tx.layer.cornerRadius = 10
        tx.font = UIFont.systemFont(ofSize: 16)
        tx.layer.borderWidth = 3
        tx.layer.borderColor = UIColor.darkGray.cgColor
        tx.text = "Boa noiteeee"
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
    
}

extension AddNoteView:ViewCodable{
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(textView)
    }
    
    func setupConstraints() {
        setupLabelConstraints()
        setupTextViewConstraints()
    }
    
    private func setupLabelConstraints(){
        titleLabel.setCenterXWith(centerXAnchor)
        titleLabel.setTopConstraintWith(topAnchor, withConstantEqualTo: 20)
        titleLabel.setDimeensionsConstraintWith(height: 30)
    }
    
    
    private func setupTextViewConstraints(){
        textView.setTopConstraintWith(titleLabel.bottomAnchor, withConstantEqualTo: 10)
        textView.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 10)
        textView.setLeftConstraint(leftAnchor, withConstantEqualTo: 10)
        textView.setBottomConstraintWith(bottomAnchor, withConstantEqualTo: 10)
        
    }
    
    
    
}
