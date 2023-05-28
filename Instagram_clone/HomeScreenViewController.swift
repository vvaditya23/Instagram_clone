//
//  ViewController.swift
//  customXIBfileDemo
//
//  Created by ヴィヤヴャハレ・アディティア on 08/04/23.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    //var profileImage: UIImage? = nil
    //var contentImage: UIImage? = nil
    
    let storyCell = StoryCell()
    
    var profilePics = ["pic_1", "pic_2", "pic_3", "pic_4", "pic_5", "pic_6", "pic_7", "pic_8", "pic_9", "pic_10", "pic_11", "pic_12", "pic_13"]
    var userNames = ["squeamishamerican", "ruinedstood", "companyhook", "abrupthorse", "oxbirdom", "extraneouslanyard", "caughtsulphur", "nightgownpapaya", "phewsteeve", "tailpurring", "incentivefireworks", "anothervivid", "feigneddrama"]
    //var subTitles = ["abc", "xyz", "pqr", "klm", "mnq", "yzw"]
    var contentImages = ["img_1", "img_2", "img_3", "img_4", "img_5", "img_6", "img_7", "img_8", "img_9", "img_10", "img_11", "img_12", "img_13"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
        
        let FeedCellNib = UINib(nibName: "feedCell", bundle: nil)
        tableViewOutlet.register(FeedCellNib, forCellReuseIdentifier: "FeedCell")
        
        let StoryCellNib = UINib(nibName: "storyCell", bundle: nil)
        collectionViewOutlet.register(StoryCellNib, forCellWithReuseIdentifier: "StoryCell")
    }
}


extension HomeScreenViewController: UITableViewDelegate, UICollectionViewDelegate {}

extension HomeScreenViewController: UITableViewDataSource, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        
        storyCell.storyProfilePicView.image = UIImage(named: profilePics[indexPath.row])
        
        //storyCellObj.usernameReceived = userNames[indexPath.row]
        
        return storyCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath.row)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let storyViewController = storyboard.instantiateViewController(withIdentifier: "StoryViewController") as? StoryViewController else {
                return
            }
            
            // Pass any necessary data to the story view controller
        //storyViewController.imageView.image = UIImage(named: contentImages[indexPath.row])
        storyViewController.imageName = contentImages[indexPath.row]    //pass the image name to storyVC
            
            // Push the story view controller onto the navigation stack
        //self.navigationController?.popToViewController(storyViewController, animated: true)
        storyViewController.modalPresentationStyle = .overFullScreen
        present(storyViewController, animated: true)    //shows up view from below
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedCell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
        
        feedCell.contentImageView.image = nil
        
        feedCell.profileImageOutlet.image = UIImage(named: profilePics[indexPath.row])
        //cell.profileImageOutlet.image = profileImage
        feedCell.userNameLabel.text = userNames[indexPath.row]
        //feedCell.subTitleLabel.text = subTitles[indexPath.row]
        feedCell.contentImageView.image = UIImage(named: contentImages[indexPath.row])
        //cell.contentImageView.image = contentImage
        
        storyCell.username = userNames[indexPath.row]
        
        return feedCell
    }
}
