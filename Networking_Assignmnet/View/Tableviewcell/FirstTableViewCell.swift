//
//  FirstTableViewCell.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    
    @IBOutlet var cellprice: UILabel!
    @IBOutlet var cellproducer: UILabel!
    @IBOutlet var cellProductTitle: UILabel!
    @IBOutlet var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
