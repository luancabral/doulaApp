//
//  NotesCollectionViewCell.swift
//  DoulaApp
//
//  Created by Luan Cabral on 22/10/21.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "NotesCollectionViewCell"
    
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.separatorStyle  = .none
        table.showsVerticalScrollIndicator = false
        table.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        return table
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
    
    public func setupTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    @objc func writeClick(){
        print("")
    }
    
    
    
}


extension NotesCollectionViewCell:ViewCodable{
    func setupViewHierarchy() {
        
        addSubview(tableView)

    }
    
    func setupConstraints() {
        setupTableViewConstraints()
    }
    
    
    func setupTableViewConstraints(){
        tableView.setTopConstraintWith(safeAreaLayoutGuide.topAnchor, withConstantEqualTo: 70)
        tableView.setBottomConstraintWith(safeAreaLayoutGuide.bottomAnchor)
        tableView.setLeftConstraint(leftAnchor)
        tableView.setRightConstraintWith(rightAnchor)
    }
}


