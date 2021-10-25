//
//  NotesCollectionViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 22/10/21.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "NotesCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


