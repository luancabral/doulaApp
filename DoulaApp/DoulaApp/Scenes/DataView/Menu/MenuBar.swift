//
//  MenuBar.swift
//  DoulaApp
//
//  Created by Luan Cabral on 21/10/21.
//

import UIKit


protocol MenuBarProtocol:AnyObject{
    func changeCollection(menuIndex:Int)
}

class MenuBar: UIView {
    
    weak private var delegate:MenuBarProtocol?
    
    let barIconName = ["pencil.circle.fill","building.2.crop.circle.fill","heart.circle.fill","person.crop.circle.fill"]
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.isScrollEnabled = false
        cv.register(MenuCellCollectionViewCell.self, forCellWithReuseIdentifier: MenuCellCollectionViewCell.identifier)
        cv.contentInset =  UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        let selectedInexPath = IndexPath(item: 0, section: 0)
        cv.selectItem(at: selectedInexPath, animated: false, scrollPosition: [])
        return cv
    }()
    
    lazy var horizontalBar:UIView = {
        let view = UIView()
        view.backgroundColor = .doulaBlueDark
        return view
    }()
    
    var horizontalBarLeftAnchor:NSLayoutConstraint?
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .red
        setupViews()
    }
    
    public func delegate(delegate:MenuBarProtocol){
        self.delegate = delegate
    }
    
    
    
}

extension MenuBar:ViewCodable {
    func setupViewHierarchy() {
        addSubview(collectionView)
        addSubview(horizontalBar)
    }
    
    func setupConstraints() {
        setupCollectionViewConstraints()
        setupHorizontalBarConstraints()
    }
    
    private func setupCollectionViewConstraints(){
        collectionView.setTopConstraintWith(topAnchor)
        collectionView.setBottomConstraintWith(bottomAnchor)
        collectionView.setLeftConstraint(leftAnchor)
        collectionView.setRightConstraintWith(rightAnchor)
    }
    
    private func setupHorizontalBarConstraints(){
        horizontalBarLeftAnchor = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchor?.isActive = true
        horizontalBar.setBottomConstraintWith(bottomAnchor)
        horizontalBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        horizontalBar.setDimeensionsConstraintWith(height: 4)
    }
}


extension MenuBar:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.changeCollection(menuIndex: indexPath.item)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MenuCellCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCellCollectionViewCell.identifier, for: indexPath) as? MenuCellCollectionViewCell
        cell?.imageView.image  = UIImage(systemName: barIconName[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    
}
