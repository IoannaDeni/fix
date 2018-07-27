//
//  SuperheroViewController.swift
//  flix
//
//  Created by user143365 on 7/26/18.
//  Copyright © 2018 Ioanna Deni. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
        let layout  = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellPerLine: CGFloat = 2
        let interItemSpacingTotal = (layout.minimumInteritemSpacing * (cellPerLine - 1))
        let width = collectionView.frame.size.width
         / cellPerLine - interItemSpacingTotal / cellPerLine
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        collectionView.dataSource=self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String{
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString+posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    func fetchMovies() {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData;
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data{
                var dataDictionary: [String: Any]?
                do {
                    dataDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch let parseError {
                    print(parseError.localizedDescription)
                    return
                }
                let movies = dataDictionary!["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
                //self.refreshControl.endRefreshing()
            }
        }
        
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailSuperViewController
            detailViewController.movies=movie
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
