//
//  TableViewCell.swift
//  Chitti Care
//
//  Created by kireeti on 15/12/18.
//  Copyright © 2018 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var infoLbl: UILabel!
    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
