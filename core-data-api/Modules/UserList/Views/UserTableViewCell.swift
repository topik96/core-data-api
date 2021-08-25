//
//  UserTableViewCell.swift
//  core-data-api
//
//  Created by Topik Mujianto on 24/08/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var AddressLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
