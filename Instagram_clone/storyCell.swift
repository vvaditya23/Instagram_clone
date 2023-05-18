//
//  storyCell.swift
//  Instagram_clone
//
//  Created by ヴィヤヴャハレ・アディティア on 18/05/23.
//

import UIKit

class storyCell: UICollectionViewCell {

    @IBOutlet weak var storyProfilePicView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyProfilePicView.layer.cornerRadius = 25
        storyProfilePicView.layer.borderColor = UIColor.systemPink.cgColor
        storyProfilePicView.layer.borderWidth = 2.0
    }

}
