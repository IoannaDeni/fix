//
//  PosterCell.swift
//  flix
//
//  Created by user143365 on 7/26/18.
//  Copyright © 2018 Ioanna Deni. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints=false
        posterImageView.clipsToBounds = true
    
    }
    override func  layoutSubviews() {
        super.layoutSubviews()
        posterImageView.clipsToBounds = true
        
    }
}
