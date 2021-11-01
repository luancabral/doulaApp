//
//  NavigationExtension.swift
//  DoulaApp
//
//  Created by Luan Cabral on 31/10/21.
//

import UIKit

class NavigationExtension: UIView {
    
    lazy var weeksLabel:UILabel = {
        let label = UILabel()
        label.text = "DPP"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var dppLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
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
        setupViews()
    }
    
}


extension NavigationExtension:ViewCodable{
    func setupViewHierarchy() {
        addSubview(weeksLabel)
        addSubview(dppLabel)
    }
    
    func setupConstraints() {
        setupDPPLabelConstraints()
        setupWeekLabelConstraints()
    }
    
    private func setupDPPLabelConstraints(){
        weeksLabel.setCenterXWith(centerXAnchor)
        weeksLabel.setTopConstraintWith(topAnchor)
        
    }
    
    private func setupWeekLabelConstraints(){
        dppLabel.setCenterXWith(centerXAnchor)
        dppLabel.setTopConstraintWith(weeksLabel.bottomAnchor, withConstantEqualTo: 3)
    }
    
    
}
