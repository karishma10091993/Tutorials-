//
//  Section.swift
//  Collapsable_Expandable_Classes
//
//  Created by kireeti on 10/01/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit


class ProductsData {
    
    var greatGiftData = [Alltimegreatgiftslist]()
    var homeProductData = [HomePageProducts]()
    var seasonsSpecialData = [SeasonsSpecialList]()
    var allCategoriesData = [Allcategorieslist]()
        init(dict: [String:Any]){
            // alltime gift
        let giftData = dict["Allcategorieslist"] as! [[String:Any]]
        for i in giftData {
            let prodAllGreatGift = Alltimegreatgiftslist.init(dict: i)
            self.greatGiftData.append(prodAllGreatGift)
            
        }
            //homePageData
      let homePageData = dict["HomePageProducts1"] as! [[String:Any]]
            for j in homePageData {
                let prodHomeData = HomePageProducts.init(dict: j)
                self.homeProductData.append(prodHomeData)
                
            }
       
    //seasonData
    let seasonsData = dict["seasonsspeciallist"] as! [[String:Any]]
    for k in seasonsData {
        let prodSeasons = SeasonsSpecialList.init(dict: k)
        self.seasonsSpecialData.append(prodSeasons)
    
    }
        //Allcategorieslist
            let allCatData = dict["Allcategories list"] as! [[String:Any]]
            for l in allCatData {
                let prodAllCat = Allcategorieslist.init(dict: l)
                self.allCategoriesData.append(prodAllCat)
                
            }
}
}
class SectionInfo {
   var isCollapsed = false
    var items: [String]
    var sectionTitle: String?
    
    init(sectionTitle: String,items: [String]) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.isCollapsed = false
    }
}
class Alltimegreatgiftslist {
    let categoryname : String
    let imagepath : String
    
    init(dict:[String:Any]) {
        self.categoryname = dict["categoryname"] as! String
        self.imagepath = dict["imagepath"] as! String
    }
}
class HomePageProducts {
    let product_name : String
    let product_zoom_image : String
    init(dict:[String:Any]) {
        self.product_name = dict["product_name"] as! String
        self.product_zoom_image = dict["product_zoom_image"] as! String
    }
}
class SeasonsSpecialList {
    let imagepath11 : String
    let categoryname11 : String
    init(dict:[String:Any]) {
        self.categoryname11 = dict["categoryname"] as! String
        self.imagepath11 = dict["imagepath"] as! String
    }
}
struct Allcategorieslist {
    let category_name : String
    let image_path : String
    init(dict:[String:Any]) {
        self.category_name = dict["category_name"] as! String
        self.image_path = dict["image_path"] as! String
    }
}

