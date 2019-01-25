//
//  SecondVC.swift
//  Chitti Care
//
//  Created by kireeti on 14/12/18.
//  Copyright © 2018 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    var careInfoArray = NSMutableArray()
    var barBtn = UIBarButtonItem()
    override func viewDidLoad() {
   careInfoArray = ["Customer Information","Collection Details","Outstanding Details","Agents Performance","Company Investment","Bid Payable"]
    self.navigationItem.title = "Personal Information"
     navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        // Do any additional setup after loading the view.
    }
    
@objc func logoutButtonTapped(sender: UIBarButtonItem) {
   let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
    self.navigationController?.present(loginVC!, animated: true, completion: nil)
       
    }
}

extension SecondVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.careInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.infoLbl.text = self.careInfoArray[indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            let CustomerInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomerInfoVC")
            self.navigationController?.pushViewController(CustomerInfoVC!, animated: true)
        }
        if indexPath.row == 1{
            let CollectionDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectionDetailsVC")
            self.navigationController?.pushViewController(CollectionDetailsVC!, animated: true)
        }
        if indexPath.row == 2{
            let OutstandingDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "OutstandingDetailsVC")
            self.navigationController?.pushViewController(OutstandingDetailsVC!, animated: true)
        }
        if indexPath.row == 3{
            let AgentsPerformanceVC = self.storyboard?.instantiateViewController(withIdentifier: "AgentsPerformanceVC")
            self.navigationController?.pushViewController(AgentsPerformanceVC!, animated: true)
        }
        if indexPath.row == 4{
            let CompanyInvestmentVC = self.storyboard?.instantiateViewController(withIdentifier: "CompanyInvestmentVC")
            self.navigationController?.pushViewController(CompanyInvestmentVC!, animated: true)
        }
        if indexPath.row == 5{
            let BidPayableVC = self.storyboard?.instantiateViewController(withIdentifier: "BidPayableVC")
            self.navigationController?.pushViewController(BidPayableVC!, animated: true)
        }
    }
    
    
    
    
    
    }



