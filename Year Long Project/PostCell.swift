//
//  PostCell.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 3/20/23.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postContentLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    
    @IBOutlet weak var postStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with post: Post) {
        postTitleLabel.text = post.title
        postContentLabel.text = post.content
        datePostedLabel.text = "Posted \(post.date.formatted(date: .complete, time: .shortened))"
    }
    
    func requiredHeight() -> CGFloat {
        
        let contentWidth = contentView.bounds.width
        
        postContentLabel.numberOfLines = 0
        postContentLabel.lineBreakMode = .byWordWrapping
        
        let contentLabelHeight = postContentLabel.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude)).height
        
        let titleLabelHeight = postTitleLabel.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude)).height
        
        let datePostedLabelHeight = datePostedLabel.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude)).height
        
        let totalHeight =  contentLabelHeight + titleLabelHeight + datePostedLabelHeight // + padding from stack view, add later
        
        return totalHeight
    }
}
