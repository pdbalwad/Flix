//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Priyanka Balwadkar on 9/27/20.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var movies = [[String : Any]]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
        // This will run when the network request returns
        if let error = error {
                      print(error.localizedDescription)
        } else if let data = data {
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

        // TODO: Get the array of movies
        // TODO: Store the movies in a property to use elsewhere
        self.movies = dataDictionary["results"] as! [[String : Any]]
        print(self.movies)
        // TODO: Reload your collection view data
            self.collectionView.reloadData()

        }
    }
    task.resume()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        //Grab movie poster, title and overview
        let movie = movies[indexPath.item]
        
        //grab a poster for the movie
        let baseUrl = "https://image.tmdb.org/t/p/w780"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af_setImage(withURL : posterUrl!)
        return cell
    
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let cell = sender as! UICollectionViewCell
        
        
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.item]
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        
        collectionView.deselectItem(at: indexPath, animated: true)
        // Pass the selected object to the new view controller.
    }
    

}
