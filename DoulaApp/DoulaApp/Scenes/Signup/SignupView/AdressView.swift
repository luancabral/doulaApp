//
//  AdressView.swift
//  DoulaApp
//
//  Created by Luan Cabral on 19/10/21.
//

import UIKit

class AdressView: UIView {
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
        self.backgroundColor = .yellow
    }

}
