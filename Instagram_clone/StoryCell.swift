//
//  storyCell.swift
//  Instagram_clone
//
//  Created by ヴィヤヴャハレ・アディティア on 18/05/23.
//

import UIKit

class StoryCell: UICollectionViewCell {

    @IBOutlet weak var storyProfilePicView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var username = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyProfilePicView.layer.cornerRadius = 25
        storyProfilePicView.layer.borderColor = UIColor.systemPink.cgColor
        storyProfilePicView.layer.borderWidth = 2.0
        
        usernameLabel.text = username
    }

}
