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
        view.layer.borderWidth = 0.7
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    
    lazy var labelTitle:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    
    lazy var contentLabel:UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .justified
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.numberOfLines = 4
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
        self.backgroundColor = .doulaAppGray
    }
    
    public func setupItems(note:Note?){
        
        guard let note = note else{
            return
        }
        self.labelTitle.text = note.title
        self.contentLabel.text = note.content
    }

}


extension NoteTableViewCell:ViewCodable{
    func setupViewHierarchy() {
        addSubview(textView)
        textView.addSubview(labelTitle)
        textView.addSubview(contentLabel)
    }
    
    func setupConstraints() {
        setupTextView()
        setupTitleLabel()
        setupContentLabelConstraint()
    }
    
    
    private func setupTextView(){
        textView.setTopConstraintWith(topAnchor, withConstantEqualTo: 10)
        textView.setBottomConstraintWith(bottomAnchor, withConstantEqualTo: 10)
        textView.setRightConstraintWith(rightAnchor, whitConstantEqualTo: 10)
        textView.setLeftConstraint(leftAnchor, withConstantEqualTo: 10)
    }
    
    private func setupTitleLabel(){
        labelTitle.setCenterXWith(centerXAnchor)
        labelTitle.setTopConstraintWith(topAnchor, withConstantEqualTo: 15)
//        labelTitle.setDimeensionsConstraintWith(height: 44)
    }
    
    private func setupContentLabelConstraint(){
        contentLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 25)
        contentLabel.setLeftConstraint(safeAreaLayoutGuide.leftAnchor, withConstantEqualTo: 25)
        contentLabel.setCenterXWith(centerXAnchor)
//        contentLabel.setCenterYWith(centerYAnchor)
        contentLabel.setTopConstraintWith(labelTitle.bottomAnchor, withConstantEqualTo: 5)
//        contentLabel.setBottomConstraintWith(bottomAnchor)

    }
    
    
}
