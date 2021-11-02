//
//  ViewController.swift
//  DoulaApp
//
//  Created by Luan Cabral on 16/10/21.
//

import UIKit
import CoreData

class HomeVC: UIViewController {
    
    var width = UIScreen.main.bounds.width
    var homeView:HomeView?
    var moms:[Mom]?
    let stack = CoreDataStack.shared
    var doula:Doula?
    var collectionNb:Int = 1
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView?.configCollectionViewProtocol(delegate: self, dataSource: self)
        self.navigationController?.isNavigationBarHidden = true
        self.fetchPeople()
        self.countWeeks()
        self.homeView?.doulaLabel.text = self.doula?.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchPeople()
    }
    
    func fetchPeople(){
        do {
            self.moms = try stack.viewContext.fetch(Mom.fetchRequest())
            self.doula = try stack.viewContext.fetch(Doula.fetchRequest()).first
            //refresh collection with dispatch
        } catch {
            print("Error")
        }
    }
    
    func countWeeks(){
//        let components = Calendar.current.dateComponents([.weekOfYear], from: date ?? Date(), to: Date())
        moms?.forEach({ mom in
            let date = stringToDate(dataString: mom.baby?.pregnanceBegin)
            let weeks = Calendar.current.dateComponents([.weekOfYear], from: date ?? Date(), to: Date())
            mom.baby?.weeks =  "\(weeks.weekOfYear ?? 0) semanas"
            if mom.dpp == nil{
                let dppDate:Date? = setupDPP(mom:mom, pregrenanceBegin: date)
                if let dppDate = dppDate {
                    mom.dpp = dppDate
                    stack.saveContext()
                }
            }
           
        })
    }
    
    func setupDPP(mom:Mom, pregrenanceBegin:Date?) -> Date?{
        var dppDate:String?
        let date = stringToDate(dataString: mom.baby?.pregnanceBegin)
        let calendar = Calendar.current
        guard let date = date,let beginDate = pregrenanceBegin else {
            return nil
        }
        guard let dppDay = Calendar.current.date(byAdding: .day, value: 7, to: date) else{
            return nil
        }
        
        guard let dppMonth = Calendar.current.date(byAdding: .month, value: -3, to: date) else{
            return nil
        }
            let dayDpp = calendar.dateComponents([.day], from: dppDay)
            let month = calendar.dateComponents([.month], from: dppMonth)
            let dumMonthYear = calendar.dateComponents([.month, .year], from: beginDate)
            
        guard let monthDpp = month.month, let dumMonth = dumMonthYear.month, let dumYear = dumMonthYear.year, let dayDpp = dayDpp.day else {
                return nil
            }
            
            if monthDpp < dumMonth{
                dppDate =  "\(dayDpp)/\(monthDpp)/\(dumYear + 1)"
            }else{
                dppDate = "\(dayDpp)/\(dppMonth)/\(dumYear)"
            }
        
            return stringToDate(dataString: dppDate)

        }

    
    func stringToDate(dataString:String?) -> Date?{
//        let  date = self.dateToString(dataString: self.babyRegisteView?.pregnanceStartTextField.text)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let date = dateFormatter.date(from: dataString ?? "10/02/1999") else{
            return nil
        }
        return date
    }

}

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (moms?.count ?? 0) + 1
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            homeView?.momCollectionView.register(RegisterMomCollectionViewCell.self, forCellWithReuseIdentifier: RegisterMomCollectionViewCell.identifier)
            
            let cell:RegisterMomCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: RegisterMomCollectionViewCell.identifier, for: indexPath) as? RegisterMomCollectionViewCell
            return cell ?? UICollectionViewCell()
        }
        
        homeView?.momCollectionView.register(MomCollectionViewCell.self, forCellWithReuseIdentifier: MomCollectionViewCell.identifier)
        
        let cell:MomCollectionViewCell?  = collectionView.dequeueReusableCell(withReuseIdentifier: MomCollectionViewCell.identifier, for: indexPath) as? MomCollectionViewCell
        if let mother = moms{
            cell?.setupCell(data: mother[indexPath.row - 1])
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 154, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let addMom:SignupViewController = SignupViewController()
            self.navigationController?.pushViewController(addMom, animated: false)
            return
        }
        
        guard let mom = self.moms else{
            return
        }
        let profileVC:ProfileViewController = ProfileViewController()
        profileVC.selectedMom = mom[indexPath.item - 1]
        
        self.navigationController?.pushViewController(profileVC, animated: false)
        
    }

    
}
