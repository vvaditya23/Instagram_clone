//
//  customTableViewCell.swift
//  customXIBfileDemo
//
//  Created by ヴィヤヴャハレ・アディティア on 08/04/23.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var profileImageOutlet: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    //@IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageOutlet.layer.cornerRadius = 25
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FeedCell.didDoubleTap(_:)))
        tapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(tapGesture)
        contentImageView.clipsToBounds = true
        
        userNameLabel.tag = 0
    }
    
    @objc func didDoubleTap(_ gesture: UISwipeGestureRecognizer) {
        //print("double tapped")
        
        guard let gestureView = gesture.view else {
            return
        }
        // create a heart, show in faded, disappear in faded and remove heart
        let heart = UIImageView(image: UIImage(systemName: "heart.fill"))

        heart.tintColor = .red
        heart.center = gestureView.center
        
        gestureView.addSubview(heart)
        
        let size = gestureView.frame.size.width/4
        heart.frame = CGRect(x: (gestureView.frame.size.width-size)/2, y: (gestureView.frame.size.height-size)/2, width: size, height: size)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.25, execute: {
            
            UIView.animate(withDuration: 0.5) {
                heart.alpha = 0
            }
        })
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        //print("like button tapped")
        let likedButtonImage = UIImage(systemName: "heart.fill")
        let redLikedButtonImage = likedButtonImage?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        let unlikedButtonImage = UIImage(systemName: "heart")
        
        likedButtonImage?.withTintColor(.systemRed)
        if userNameLabel.tag == 0 {
            likeButton.setImage(redLikedButtonImage, for: .normal)
            userNameLabel.tag = 1
            
            UserDefaults.standard.set(true, forKey: "Key") //Bool
            UserDefaults.standard.set(1, forKey: "Key")  //Integer
            UserDefaults.standard.set("TEST", forKey: "Key") //setObject
            
        } else {
            likeButton.setImage(unlikedButtonImage, for: .normal)
            userNameLabel.tag = 0
            
            UserDefaults.standard.removeObject(forKey: "Key")
        }
    }
    
}
