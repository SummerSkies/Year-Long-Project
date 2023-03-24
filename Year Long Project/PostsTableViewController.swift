//
//  PostsTableViewController.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 3/20/23.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    var posts: [Post] = [
        Post(title: "Just finished the first App prototype!", content: "It took me a few months of troubleshooting, but I'm confident that I'll be able to enter the bugfixing and polishing stages soon.", date: Date(),
             comments: [Comment(user: "clubLOL", comment: "Wow!"), Comment(user: "ShrunkFunkShuffle", comment: "Cool!")]),
        Post(title: "Coding is hard.", content: "Like, seriously.", date: Date(timeIntervalSinceReferenceDate: 693792000.0),
             comments: [Comment(user: "TheKFunk", comment: "Definitely.")]),
        Post(title: "Just found out about For loops.", content: "I will be using these constantly now. And no, I did not learn them before, as suggested in my last post...", date: Date(timeIntervalSinceReferenceDate: 688435200.0),
             comments: [Comment(user: "BeenThereDoneThat", comment: "You're been coding for how long without knowing this?")]),
        Post(title: "How do you access each element in an array?", content: "I need all the elements in my array to follow certain protocol for my app, and I know there's a way to do what I want. I have the rest of teh code functioning, but I can't remember the syntax for accessing elements of an array. Assuming I ever learned it, that is.", date: Date(timeIntervalSinceReferenceDate: 661651200.0),
             comments: [Comment(user: "PetuniaDino", comment: "I understand nothing you just said...")]),
        Post(title: "Two bros", content: "chillin in a hot tub", date: Date(timeIntervalSinceReferenceDate: 660614400.0),
             comments: [Comment(user: "HeroOfLionsArch", comment: "five feet apart")]),
        Post(title: "I used to be scared of Slender Man", content: "Then I watched a playthough of Emily Wants to Play. I had a hard time falling asleep for a night or two, but eventually I wasn't scared anymore. I asked my brother if exposure made me less scard, and he said, \"Probably.\" Then I vowed I would watch every playthrouughs of every horror game I was scared of.", date: Date(timeIntervalSinceReferenceDate: 629078400.0),
             comments: [Comment(user: "SansSkeleton", comment: "Emily Wants to Play 10/10 would reccommend")]),
        Post(title: "What flower are you?", content: "Made a personality quiz for the heck of it.", date: Date(timeIntervalSinceReferenceDate: 566006400.0),
             comments: [Comment(user: "Ladybug", comment: "Can I take it?")]),
        Post(title: "Do do do do do do do", content: "do do do, do do do", date: Date(timeIntervalSinceReferenceDate: 562464000.0),
             comments: [Comment(user: "Bubblegum", comment: "Is that hall of the mountain king?"), Comment(user: "Cyber", comment: "How on earth could you tell?"), Comment(user: "Florida", comment: "She's got a talent for weird things like this.")]),
        Post(title: "I wonder if I could be a writer.", content: "I've tried my hand at it many times but I'm not sure about my skill level. I've been writing on and off since 3rd grade, though of course my skills back then were terrible. I've since gotten the approval of my aunt, who writes for a living. But is that because I'm very good, or because I'm better than she was when she was my age?", date: Date(timeIntervalSinceReferenceDate: 562291200.0),
             comments: [Comment(user: "JustAHouseCat", comment: "Sounds like you need a course, I'm teaching one at the end of the summer.")]),
        Post(title: "Testing the algorithm", content: "How many people will see this post?", date: Date(timeIntervalSinceReferenceDate: 560304000.0),
             comments: [])
    ]
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        posts.sort { $0.date > $1.date }
        
        tableView.reloadData()
        tableView.estimatedRowHeight = 38.0
            //improves performance, if causing issues remove
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let commentsCount = posts[section].comments.count
        return commentsCount > 0 ? commentsCount + 1 : 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.section]
        
        if indexPath.row == 0 {
            let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
            postCell.update(with: post)
            
            return postCell
        } else if post.comments.count == 0 {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
            defaultCell.defaultLabel?.text = "No comments yet."
            
            return defaultCell
        } else {
            let comment = post.comments[indexPath.row - 1]
            let commentCell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
            commentCell.update(with: comment)
            
            return commentCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
   }
   
   override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       selectedIndexPath = nil
       tableView.reloadRows(at: [indexPath], with: .automatic)
   }
/*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            if let postCell = tableView.cellForRow(at: indexPath) as? PostCell {
                
                let height = postCell.requiredHeight()
                
                postCell.postContentLabel.numberOfLines = 2
                postCell.postContentLabel.lineBreakMode = .byTruncatingTail
                
                return height
            } else if let commentCell = tableView.cellForRow(at: indexPath) as? CommentCell {
                let height = commentCell.requiredHeight()
                return height
            }
        }
        return UITableView.automaticDimension
    }
 */
}
