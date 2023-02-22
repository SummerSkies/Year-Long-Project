//
//  ViewController.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 2/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var usersNameLabel: UILabel!
    @IBOutlet weak var userInterestsLabel: UILabel!
    @IBOutlet weak var userCompaniesLabel: UILabel!
    @IBOutlet weak var userDislikesLabel: UILabel!
    @IBOutlet weak var userFactsLabel: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var postView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setupProfilePicture()
        callUser()
        callPost()
        postView.layer.cornerRadius = 5
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
    
    func callPost() {
        let mostRecentPost = Post(title: "Just finished the first App prototype!", content: "It took me a few months of troubleshooting, but I'm confident that I'll be able to enter the bugfixing and polishing stages soon.", date: Date(timeIntervalSinceReferenceDate: -123456789.0))
        
        let weekday = Calendar.current.component(.weekday, from: mostRecentPost.date)
        let month = Calendar.current.component(.month, from: mostRecentPost.date)
        let date = Calendar.current.component(.day, from: mostRecentPost.date)
        
        postTitle.text = mostRecentPost.title
        postContent.text = mostRecentPost.content
        datePostedLabel.text = "Posted \(Calendar.current.weekdaySymbols[weekday-1]), \(Calendar.current.shortMonthSymbols[month-1]) \(date)"
    }
}

struct User {
    var name: String
    var techInterests: String
    var techCompanies: String
    var dislikedTech: String
    var extraUserFacts: String
    var profilePicture: UIImage
}

struct Post {
    var title: String
    var content: String
    var date: Date
}
