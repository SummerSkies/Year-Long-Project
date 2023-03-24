//
//  DefaultCell.swift
//  Year Long Project
//
//  Created by Juliana Nielson on 3/21/23.
//

import UIKit

class DefaultCell: UITableViewCell {

    @IBOutlet weak var defaultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
