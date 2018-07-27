//
//  DetailSuperViewController.swift
//  flix
//
//  Created by user143365 on 7/27/18.
//  Copyright © 2018 Ioanna Deni. All rights reserved.
//

import UIKit

class DetailSuperViewController: UIViewController {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var movies: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movies = movies{
            titleLabel.text=movies["title"] as? String
            releaseDateLabel.text=movies["release_date"] as? String
            overviewLabel.text=movies["overview"] as? String
            let backdropPathString = movies["backdrop_path"] as? String
            let posterPathString = movies["poster_path"] as? String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString + backdropPathString!)
            
            backImageView.af_setImage(withURL: backdropURL!)
            
            let posterPathURL = URL(string: baseURLString + posterPathString!)
            posterImageView.af_setImage(withURL: posterPathURL!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
