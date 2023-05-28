//
//  StoryViewController.swift
//  Instagram_clone
//
//  Created by ヴィヤヴャハレ・アディティア on 26/05/23.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageView.image = UIImage(named: imageName)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
            swipeGesture.direction = .down
            view.addGestureRecognizer(swipeGesture)
        
    }
    
    @objc func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .down {
            // Perform the desired action to go back to the previous view controller
            //print("swiped")
            
            self.dismiss(animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
