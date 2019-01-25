//
//  CustomerInfoView.swift
//  Chitti Care
//
//  Created by kireeti on 18/12/18.
//  Copyright © 2018 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class CustomerInfoView: UIView {

    @IBOutlet var ContentView: UIView!
    
    @IBOutlet var nosTotal: UILabel!
    @IBOutlet var nosSF: UILabel!
    @IBOutlet var nosPS: UILabel!
    @IBOutlet var nosNPSLbl: UILabel!
    // Only override draw() if you perform custom drawing.
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    // An empty implementation adversely affects performance during animation.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
    }
    private func commitInit(){
        Bundle.main.loadNibNamed("CustomerInfoView", owner: self, options: nil)
        addSubview(ContentView)
        ContentView.frame = self.bounds
        ContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
