//
//  ViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 16/10/21.
//

import UIKit

class HomeVC: UIViewController {
    
    var width = UIScreen.main.bounds.width
    var homeView:HomeView?
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView?.configCollectionViewProtocol(delegate: self, dataSource: self)
        // Do any additional setup after loading the view.
    
    }

}


extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MomCollectionViewCell?  = collectionView.dequeueReusableCell(withReuseIdentifier: MomCollectionViewCell.identifier, for: indexPath) as? MomCollectionViewCell
        cell?.setupCell(data: .blue)
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 154, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }

    
}

