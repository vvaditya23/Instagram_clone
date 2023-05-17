//
//  ViewController.swift
//  customXIBfileDemo
//
//  Created by ヴィヤヴャハレ・アディティア on 08/04/23.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var profileImage: UIImage? = nil
    var contentImage: UIImage? = nil
    
    //var profilePics = ["pic_1", "pic_2", "pic_3", "pic_4", "pic_5"]
    var userNames = ["user_1", "User_2", "User_3", "User_4", "User_5"]
    var subTitles = ["abc", "xyz", "pqr", "klm", "mnq", "yzw"]
    //var contentImages = ["img_1", "img_2", "img_3", "img_4", "img_5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        let CellNib = UINib(nibName: "customTableViewCell", bundle: nil)
        tableViewOutlet.register(CellNib, forCellReuseIdentifier: "CustomCell")
        
        //for profile img (the api is default frm the pod)
        AF.request("https://httpbin.org/image/png").responseImage { response in
            debugPrint(response)

            print(response.request)
            print(response.response)
            debugPrint(response.result)

            if case .success(let fetchedProfileImage) = response.result {
                //print("image downloaded: \(profileImage)")
                self.profileImage = fetchedProfileImage
            }
        }
        
        //for content image
        AF.request("https://random.imagecdn.app/500/150").responseImage { response in
            debugPrint(response)

            print(response.request)
            print(response.response)
            debugPrint(response.result)

            if case .success(let fetchedContentImage) = response.result {
                //print("image downloaded: \(contentImage)")
                self.contentImage = fetchedContentImage
            }
        }
        
    }
}


extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! customTableViewCell
        
        cell.contentImageView.image = nil
        
        //cell.profileImageOutlet.image = UIImage(named: profilePics[indexPath.row])
        cell.profileImageOutlet.image = profileImage
        cell.userNameLabel.text = userNames[indexPath.row]
        cell.subTitleLabel.text = subTitles[indexPath.row]
        //cell.contentImageView.image = UIImage(named: contentImages[indexPath.row])
        cell.contentImageView.image = contentImage
        
        return cell
    }
}
