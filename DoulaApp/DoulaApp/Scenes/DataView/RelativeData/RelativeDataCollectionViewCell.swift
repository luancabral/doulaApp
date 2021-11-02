

import UIKit


class RelativeDataCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "RelativeDataCollectionViewCell"
    
    lazy var hospitalLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .doulaAppPurple
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text  = "Dados do Parente"
        return label
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text  = "Nome do Parente:"
        return label
    }()
    
    lazy var nameFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.text  = "Testando o nome"
        return label
    }()
    
    lazy var contactLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Contato parente"
        return label
    }()
    
    lazy var contactFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.text  = "Testando o contato"
        return label
    }()
    
    lazy var kindshipLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Grau de parentesco"
        return label
    }()
    
    lazy var kindshipFieldLabel:UILabel = {
        let label = UILabel()
        label.textColor =  .darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.text  = "Testando o parentesco"
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
        self.backgroundColor = .white
        setupViews()
    }
    
    
    public func setupField(relative:Relative?){
        guard let relative = relative else {
            return
        }
        self.nameFieldLabel.text = relative.name
        self.contactFieldLabel.text = relative.phone
        self.kindshipFieldLabel.text = relative.kinship
    }

}


extension RelativeDataCollectionViewCell:ViewCodable {
    func setupViewHierarchy() {
        addSubview(hospitalLabel)
        addSubview(nameLabel)
        addSubview(nameFieldLabel)
        addSubview(contactLabel)
        addSubview(contactFieldLabel)
        addSubview(kindshipLabel)
        addSubview(kindshipFieldLabel)
    }
    
    func setupConstraints() {
        setupnameLabelConstraints()
    }
    
    
    private func setupnameLabelConstraints(){
        
        hospitalLabel.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 100)
        hospitalLabel.setCenterXWith(centerXAnchor)
       

        nameLabel.setTopConstraintWith(hospitalLabel.bottomAnchor, withConstantEqualTo: 20)
        nameLabel.setLeftConstraint(safeAreaLayoutGuide.leftAnchor, withConstantEqualTo: 30)
        nameLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        nameFieldLabel.setTopConstraintWith(nameLabel.bottomAnchor, withConstantEqualTo: 5)
        nameFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        nameFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        contactLabel.setTopConstraintWith(nameFieldLabel.bottomAnchor, withConstantEqualTo: 20)
        contactLabel.setLeftConstraint(nameLabel.leftAnchor)
        contactLabel.setRightConstraintWith(nameLabel.rightAnchor)

        contactFieldLabel.setTopConstraintWith(contactLabel.bottomAnchor, withConstantEqualTo: 5)
        contactFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        contactFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        kindshipLabel.setTopConstraintWith(contactFieldLabel.bottomAnchor, withConstantEqualTo: 20)
        kindshipLabel.setLeftConstraint(nameLabel.leftAnchor)
        kindshipLabel.setRightConstraintWith(nameLabel.rightAnchor)

        kindshipFieldLabel.setTopConstraintWith(kindshipLabel.bottomAnchor, withConstantEqualTo: 5)
        kindshipFieldLabel.setLeftConstraint(nameLabel.leftAnchor)
        kindshipFieldLabel.setRightConstraintWith(safeAreaLayoutGuide.rightAnchor, whitConstantEqualTo: 10)

        
    }
    
    
    
}
