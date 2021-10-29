//
//  NoteTableViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 28/10/21.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let identifier = "NoteTableViewCell"
    
    lazy var textView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    lazy var labelTitle:UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Olaa"
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupUI(){
        setupViews()
        self.selectionStyle = .none
    }
    
    public func setupItems(note:Note?){
        
        guard let note = note else{
            return
        }
        self.labelTitle.text = note.title
    }

}


extension NoteTableViewCell:ViewCodable{
    func setupViewHierarchy() {
        addSubview(textView)
        textView.addSubview(labelTitle)
    }
    
    func setupConstraints() {
        setupTextView()
        setupTitleLabel()
    }
    
    
    func setupTextView(){
        textView.setTopConstraintWith(topAnchor, withConstantEqualTo: 10)
        textView.setBottomConstraintWith(bottomAnchor, withConstantEqualTo: 10)
        textView.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 10)
        textView.setLeftConstraint(leftAnchor, withConstantEqualTo: 10)
    }
    
    func setupTitleLabel(){
        labelTitle.setCenterXWith(centerXAnchor)
        labelTitle.setTopConstraintWith(topAnchor, withConstantEqualTo: 20)
        labelTitle.setDimeensionsConstraintWith(height: 44)
    }
    
    
}
