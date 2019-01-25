//
//  CustomerInfoVC.swift
//  Chitti Care
//
//  Created by kireeti on 15/12/18.
//  Copyright © 2018 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class CustomerInfoVC: UIViewController {

    @IBOutlet var bgView: UIView!
    @IBOutlet var testView: CustomerInfoView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var selectBranchBtn: UILabel!
    var userId = Int()
    var NPStr = Int()
    var SFStr = Int()
    var PSStr = Int()
    var totalStr = Int()
     var branchUserId = Int()
    var branchUserIdArr = NSMutableArray()
    var selectString = "true"
    var branchesNameStr = String()
    var branchesNIdStr = Int()
    @IBOutlet var tableView: UITableView!
    var branchesNamesArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        branchResults()
       // customerInfo()
        
        self.navigationItem.title = "Customer Information"
        // Do any additional setup after loading the view.
        self.userId = UserDefaults.standard.value(forKey: "User ID") as! Int
        print("------a-------", self.userId)
     self.branchesNamesArray.add("All Branches")
        self.branchUserIdArr.add(0)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        selectBranchBtn.isUserInteractionEnabled = true
        selectBranchBtn.addGestureRecognizer(tap)
    }
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        if selectString == "true"{
            selectString = "false"
            self.heightConstraint.constant = 183
        }else{
            selectString = "true"
             self.heightConstraint.constant = 0
        }
    }

    
    func branchResults(){
        let params : NSMutableDictionary = ["UserID":self.userId]
        let param1:NSMutableDictionary = ["BranchesFillRequest":params]
        APIManager.sharedInstance.postBranchResultAPIRequest(params:param1) { (result, error) in
            print("result-------",result)
            let json = result as NSDictionary
            let branchfill =  json["BranchesFillResult"] as! [[String:Any]]
            for i in branchfill{
                print("i------>",i)
                let x =  i as NSDictionary
                self.branchesNameStr = x.value(forKey: "BranchName") as! String
                self.branchUserId = x.value(forKey: "BranchId") as! Int
                print("x---->",self.branchUserId)
                self.branchUserIdArr.add(self.branchUserId)
               print("self.branchUserIdArr----->",self.branchUserIdArr)
            self.branchesNamesArray.add(self.branchesNameStr)
             
            }
           
            print("self.branchesNamesArray------>",self.branchesNamesArray)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    //{"CompanyInformationRequest":{"BranchId":0}}]
    func customerInfo(){
        let param : NSMutableDictionary = ["BranchId":self.branchesNIdStr]
        let param1 : NSMutableDictionary = ["CompanyInformationRequest":param]
        
    APIManager.sharedInstance.postCustomInfoAPIRequest(params: param1) { (result, error) in
            //print("Custom Info Result------>",result)
        let json1 = result as NSDictionary
         //   print("json1------>",json1)
        let companyInfo1 = json1["CompanyInformationResult"] as! [[String: Any]]
        print("-----Company Inf01-----",companyInfo1)
            for j in companyInfo1{
                let info = j as NSDictionary
                self.NPStr = info.value(forKey: "NPS") as! Int
               
                self.testView.nosNPSLbl.text = String(self.NPStr) as? String
                self.PSStr = info.value(forKey: "PS") as! Int
                self.testView.nosPS.text = String(self.PSStr) as? String
                self.SFStr = info.value(forKey: "SF") as! Int
                self.testView.nosSF.text = String(self.SFStr) as? String
                self.totalStr = info.value(forKey: "Total") as! Int
                //print("total----->",total)
                self.testView.nosTotal.text = String(self.totalStr) as? String
                let NPSPercent = (self.NPStr/self.totalStr)*100
                print(NPSPercent)
            }
        }
    }
    
    
    
}

extension CustomerInfoVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.branchesNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoTableViewCell", for: indexPath) as! CustomerInfoTableViewCell
        cell.textLabel!.text = self.branchesNamesArray[indexPath.row] as? String
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        self.selectBranchBtn.text = (self.branchesNamesArray[indexPath.row] as! String)
    
        branchesNIdStr = self.branchUserIdArr[indexPath.row] as! Int
        if branchesNIdStr != 1 {
            print("branchesNIdStr----->",branchesNIdStr)
            self.heightConstraint.constant = 0
            self.testView.frame = CGRect.init(x: 48, y: 235, width: 306, height: 183)
            self.tableView.isHidden = true
            customerInfo()
           bgView.addSubview(self.testView)
           
        }else{
         print("No subscribers")
             self.testView.isHidden = true
             self.heightConstraint.constant = 0
            AlertSingleton.shared.showAlerts(title: "Alert", message: "No Subscribers", target: self) {
                print("show alert")
            }
        }
    }
    
    
}


