//
//  MovieDetailsViewController.swift
//  codepath-project2
//
//  Created by Vaibhav on 07/03/23.
//

import UIKit
import AlamofireImage


class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var vote_average: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var vote_count: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        vote_average.text = "Vote Average: \(movie["vote_average"] ?? "")"
        vote_count.text = "Vote Count: \(movie["vote_count"] ?? "")"
        popularity.text = "Popularity: \(movie["popularity"] ?? "")"
        //comment...
        synopsisLabel.text = movie["overview"] as? String
        
        synopsisLabel.sizeToFit()
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        posterView.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af_setImage(withURL: backdropURL!)
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

