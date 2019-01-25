//
//  ViewController.swift
//  CollapsTableView
//
//  Created by kireeti on 17/01/19.
//  Copyright © 2019 KireetiSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var collapsTableView: UITableView!
    let sectionArray1 = ["Section 1","Section 2","Secton 3","Section 4","Section 5","Section 6"]
    let rowArray1 = ["Row 1","Row 2","Row 3","Row 4","Row 5","Row 6","Row 7","Row 8"]
    var sectionSelected0 = true
    var SectionSelected1 = true
    var SectionSelected2 = true
    var SectionSelected3 = true
    var SectionSelected4 = true
    var SectionSelected5 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArray1.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            if self.sectionSelected0{
                return rowArray1.count
            }else {
                
                
                return 0
            }
        }else if section == 1 {
            
            if self.SectionSelected1{
                return rowArray1.count
            }else {
                return 0
            }
            
        }else if section == 2 {
            
            if self.SectionSelected2{
                return rowArray1.count
            }else {
                return 0
            }
            
        }else if section == 3 {
            
            if self.SectionSelected3{
                return rowArray1.count
            }else {
                return 0
            }
            
        }else if section == 4 {
            
            if self.SectionSelected4{
                return rowArray1.count
            }else {
                return 0
            }
            
        }else if section == 5 {
            
            if self.SectionSelected5{
                return rowArray1.count
            }else {
                return 0
            }
            
        }
        return 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = rowArray1[indexPath.row]
        
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewSection = UIView()
        viewSection.backgroundColor = UIColor.lightGray
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction(sender:)))
        
        viewSection.addGestureRecognizer(tap)
        viewSection.isUserInteractionEnabled = true
        
        viewSection.tag = section
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1)
        bottomLineView.backgroundColor = UIColor.white
        let arrowImage = UIImageView(frame: CGRect(x: tableView.frame.width - 40, y: 5, width: 30, height: 30))
        viewSection.addSubview(arrowImage)
        
        let headerLabel = UILabel()
        headerLabel.text = self.sectionArray1[section]
        headerLabel.frame = CGRect(x: 10, y: 0, width: tableView.frame.width, height: 30)
        viewSection.addSubview(bottomLineView)
        viewSection.addSubview(headerLabel)
        
        if section == 0 {
            if self.sectionSelected0 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
                
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }
        else if section == 1 {
            if self.SectionSelected1 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }
        else if section == 2 {
            if self.SectionSelected2 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }else if section == 3 {
            if self.SectionSelected3 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }else if section == 4 {
            if self.SectionSelected4 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }else if section == 5 {
            if self.SectionSelected5 {
                arrowImage.image = UIImage(imageLiteralResourceName: "downArrow")
            }else{
                arrowImage.image = UIImage(imageLiteralResourceName: "upArrow")
            }
        }else{

        }
        
        return viewSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        let tag = sender.view!.tag
        print("tagView :\(tag)")
        if tag == 0 {
            if self.sectionSelected0 {
                self.sectionSelected0 = false
            }else{
                self.sectionSelected0 = true
            }
        }else if tag == 1 {
            if self.SectionSelected1 {
                self.SectionSelected1 = false
            }else{
                self.SectionSelected1 = true
            }
        }else if tag == 2 {
            if self.SectionSelected2 {
                self.SectionSelected2 = false
            }else{
                self.SectionSelected2 = true
            }
        }else if tag == 3 {
            if self.SectionSelected3 {
                self.SectionSelected3 = false
            }else{
                self.SectionSelected3 = true
            }
        }else if tag == 4 {
            if self.SectionSelected4 {
                self.SectionSelected4 = false
            }else{
                self.SectionSelected4 = true
            }
        }else if tag == 5 {
            if self.SectionSelected5 {
                self.SectionSelected5 = false
            }else{
                self.SectionSelected5 = true
            }
        }
        self.collapsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if indexPath.section == 0 {
            if self.sectionSelected0 {
                
            }else{
                print("section selected 0 = false")
                //MARK:- Fade transition Animation
                cell.alpha = 0
                UIView.animate(withDuration: 1.33) {
                    cell.alpha = 1
                }
                
                //MARK:- Curl transition Animation
                cell.layer.transform = CATransform3DScale(CATransform3DIdentity, -1, 1, 1)
                
                UIView.animate(withDuration: 1.4) {
                    cell.layer.transform = CATransform3DIdentity
                }
            }
        }
        else if indexPath.section == 1 {
            if self.SectionSelected1 {
                
            }else{
                //MARK:- Fade transition Animation
                cell.alpha = 0
                UIView.animate(withDuration: 1.33) {
                    cell.alpha = 1
                }
                
                //MARK:- Curl transition Animation
                cell.layer.transform = CATransform3DScale(CATransform3DIdentity, -1, 1, 1)
                
                UIView.animate(withDuration: 1.4) {
                    cell.layer.transform = CATransform3DIdentity
                }
            }
        }
        
    
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

