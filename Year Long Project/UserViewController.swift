//
//  ViewController.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 2/22/23.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var usersNameLabel: UILabel!
    @IBOutlet weak var userInterestsLabel: UILabel!
    @IBOutlet weak var userCompaniesLabel: UILabel!
    @IBOutlet weak var userDislikesLabel: UILabel!
    @IBOutlet weak var userFactsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setupProfilePicture()
        callUser()
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
    }
    
    func setupProfilePicture() {
        profilePictureView?.layer.cornerRadius = (profilePictureView?.frame.size.width ?? 0.0) / 2
        profilePictureView?.clipsToBounds = true
        profilePictureView?.layer.borderWidth = 3.0
        profilePictureView?.layer.borderColor = UIColor.white.cgColor
    }
    
    func callUser() {
        let userImage = UIImage(named: "Profile Art")!
        
        let currentUser = User(name: "Juliana Nielson", techInterests: "3D Modeling, Coding, Video game design", techCompanies: "StarJet", dislikedTech: "Android", extraUserFacts: "Aspiring YouTuber and video game designer", profilePicture: userImage)
        
        usersNameLabel.text = currentUser.name
        userInterestsLabel.text = currentUser.techInterests
        userCompaniesLabel.text = currentUser.techCompanies
        userDislikesLabel.text = currentUser.dislikedTech
        userFactsLabel.text = currentUser.extraUserFacts
        
        profilePictureView.image = userImage
    }
    
    struct User {
        var name: String
        var techInterests: String
        var techCompanies: String
        var dislikedTech: String
        var extraUserFacts: String
        var profilePicture: UIImage
    }
}
