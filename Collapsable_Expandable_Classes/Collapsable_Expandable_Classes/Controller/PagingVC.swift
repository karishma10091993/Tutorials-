//
//  PageMenuVC.swift
//  Collapsable_Expandable_Classes
//
//  Created by kireeti on 23/01/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit
import PageMenu
class PagingVC: UIViewController {
var pageMenu : CAPSPageMenu?
    override func viewDidLoad() {
        super.viewDidLoad()
        pageMenuDetail()
        // Do any additional setup after loading the view.
    }
    
    func pageMenuDetail(){
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let controller : UIViewController = UIViewController(nibName: "controllerNibName", bundle: nil)
        controller.title = "SAMPLE TITLE"
        controllerArray.append(controller)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect.init(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
