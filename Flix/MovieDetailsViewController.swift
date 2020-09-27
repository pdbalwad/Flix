//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Priyanka Balwadkar on 9/26/20.
//

import UIKit
import Alamofire

class MovieDetailsViewController: UIViewController {

    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie : [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        movieTitleLabel.text = movie["title"] as? String
        movieTitleLabel.sizeToFit()
        
        movieOverviewLabel.text = movie["overview"] as? String
        movieOverviewLabel.sizeToFit()
        print(movie["overview"]!)
        
        releaseDateLabel.text = movie["release_date"] as? String
        releaseDateLabel.sizeToFit()
        
        //grab a poster for the movie
        var baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        posterImageView.af_setImage(withURL : posterUrl!)
        
        //grab a dropback imaage for the movie
        let baseUrl2 = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: baseUrl2 + backdropPath)
        backdropImageView.af_setImage(withURL : backdropUrl!)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
