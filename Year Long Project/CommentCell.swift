//
//  CommentCell.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 3/20/23.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func update(with comment: Comment) {
        commentLabel.text = "\(comment.user): \(comment.comment)"
    }
    
    func requiredHeight() -> CGFloat {
        let contentWidth = contentView.bounds.width
        
        let commentLabelHeight = commentLabel.sizeThatFits(CGSize(width: contentWidth, height: CGFloat.greatestFiniteMagnitude)).height
        
        return commentLabelHeight
    }
}
