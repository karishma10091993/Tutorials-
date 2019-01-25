//
//  ViewController.swift
//  Collapsable_Expandable_Classes
//
//  Created by kireeti on 10/01/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ExpandableHeaderViewDelegate {
  
    @IBOutlet var tableView: UITableView!
    var giftCa = [String]()
    var homeCa = [String]()
     var seasonCa = [String]()
    var allCat = [String]()
    var sectionData = [SectionInfo]()
    var giftstr = String()
    var homeStr = String()
    var seasonStr = String()
    var allStr = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func parseData(){
        let urlStr = "http://iphone.us2guntur.com/AlltypeCategoriesList"
        let url = URL.init(string: urlStr)
        let urlReq = URLRequest.init(url: url!)
        let urlSession = URLSession.init(configuration: .default)
        _ = urlSession.dataTask(with: urlReq) { (data, response, error) in
            guard let data = data else{return}
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
           
//
               let giftdata = jsonResponse["Alltimegreatgiftslist"] as! [[String : Any]]
                for i in giftdata {
                    self.giftstr = Alltimegreatgiftslist.init(dict: i).categoryname
                    self.giftCa.append(self.giftstr)
                   // let prodAllGre
                }
                print("Alltimegreatgiftslist-------->",  self.giftCa)
                
                
                
                let homedata = jsonResponse["HomePageProducts1"] as! [[String : Any]]
                for j in homedata {
                    self.homeStr = HomePageProducts.init(dict: j).product_name
                    self.homeCa.append(self.homeStr)
                    // let prodAllGre
                }
                print("HomePageProducts1-------->",  self.homeCa)
                
                
                let sesData = jsonResponse["seasonsspeciallist"] as! [[String : Any]]
                for k in sesData {
                    self.seasonStr = SeasonsSpecialList.init(dict: k).categoryname11
                    self.seasonCa.append(self.seasonStr)
                    // let prodAllGre
                }
                print("SeasonsSpecialList-------->",  self.seasonCa)
                
                let catData = jsonResponse["Allcategories list"] as! [[String : Any]]
                for l in catData {
                    self.allStr = Allcategorieslist.init(dict: l).category_name
                    self.allCat.append(self.allStr)
                    // let prodAllGre
                }
                print("Allcategories list-------->",  self.allCat)
                self.sectionData = [SectionInfo.init(sectionTitle: "AllTimeGreatGifts", items: self.giftCa),
                               SectionInfo.init(sectionTitle: "HomePage Products1", items: self.homeCa),
                               SectionInfo.init(sectionTitle: "Seasons Speciallist", items: self.seasonCa),
               SectionInfo.init(sectionTitle: "AllCategoriesList", items: self.allCat)]
              //  print(self.sectionData[0].items)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData[section].items.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sectionData[indexPath.section].isCollapsed) {
            return UITableView.automaticDimension
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sectionData[section].sectionTitle!, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sectionData[indexPath.section].items[indexPath.row]
        return cell
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sectionData[section].isCollapsed = !sectionData[section].isCollapsed
        
        
        tableView.beginUpdates()
        for i in 0 ..< sectionData[section].items.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

