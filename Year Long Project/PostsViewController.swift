//
//  ViewController.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 2/22/23.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var postView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        callPost()
        postView.layer.cornerRadius = 5
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

struct Post {
    var title: String
    var content: String
    var date: Date
}
