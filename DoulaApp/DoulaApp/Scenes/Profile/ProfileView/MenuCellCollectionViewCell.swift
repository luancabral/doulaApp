//
//  MenuCellCollectionViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 22/10/21.
//

import UIKit

class MenuCellCollectionViewCell: UICollectionViewCell {
    
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .doulaAppPurple
        return imageView
        
    }()
    
    override var isHighlighted: Bool{
        didSet{
          
            imageView.tintColor = isHighlighted ? .doulaPink : .doulaAppPurple
        }
    }
    
    
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? .doulaPink : .doulaAppPurple
        }
    }
    
    static let identifier = "MenuCellCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
        backgroundColor = .clear
        setupViews()
    }
    
}


extension MenuCellCollectionViewCell:ViewCodable{
    func setupViewHierarchy() {
        addSubview(imageView)
    }
    
    func setupConstraints() {
        setupImageViewConstraints()
    }
    
    private func setupImageViewConstraints(){
        imageView.setCenterYWith(centerYAnchor)
        imageView.setCenterXWith(centerXAnchor)
        imageView.setDimeensionsConstraintWith(height: 30)
    }
    
    
}
