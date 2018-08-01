//
//  MovieCell.swift
//  flix
//
//  Created by user143365 on 7/21/18.
//  Copyright © 2018 Ioanna Deni. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.size.width
        overviewLabel.preferredMaxLayoutWidth = overviewLabel.frame.size.width
        posterImageView.clipsToBounds = true
        titleLabel.clipsToBounds = true
        overviewLabel.clipsToBounds = true
    }
    override func  layoutSubviews() {
        super.layoutSubviews()
        titleLabel.preferredMaxLayoutWidth = titleLabel.frame.size.width
        overviewLabel.preferredMaxLayoutWidth = overviewLabel.frame.size.width
        posterImageView.clipsToBounds = true
        titleLabel.clipsToBounds = true
        overviewLabel.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
