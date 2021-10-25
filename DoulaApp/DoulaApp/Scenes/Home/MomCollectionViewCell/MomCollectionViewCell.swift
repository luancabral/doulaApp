//
//  MomCollectionViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 18/10/21.
//

import UIKit

class MomCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "MomCollectionViewCell"
    
    let momCollectionViewCellView:MomCollectionViewCellView = MomCollectionViewCellView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .clear
        setupViews()
    }
    
    public func setupCell(data:Mom){
        self.momCollectionViewCellView.motherNameLabel.text = data.name
        self.momCollectionViewCellView.weeksLabel.text = data.baby?.weeks
        self.momCollectionViewCellView.dppLabel.text = self.dateToString(date: data.dpp)
    }
    
    func dateToString(date:Date?) -> String?{
//        let  date = self.dateToString(dataString: self.babyRegisteView?.pregnanceStartTextField.text)
        guard let date = date else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
        
    }
    
    
}


extension MomCollectionViewCell:ViewCodable{
    func setupViewHierarchy() {
        addSubview(momCollectionViewCellView)
    }
    
    func setupConstraints() {
        setupMomCollectionViiewCellView()
    }
    
    
    private func setupMomCollectionViiewCellView(){
        momCollectionViewCellView.setTopConstraintWith(topAnchor)
        momCollectionViewCellView.setBottomConstraintWith(bottomAnchor)
        momCollectionViewCellView.setRightConstraintWith(rightAnchor)
        momCollectionViewCellView.setLeftConstraint(leftAnchor)
    }
}
