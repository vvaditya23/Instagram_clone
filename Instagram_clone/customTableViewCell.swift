//
//  customTableViewCell.swift
//  customXIBfileDemo
//
//  Created by ヴィヤヴャハレ・アディティア on 08/04/23.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageOutlet: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageOutlet.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
