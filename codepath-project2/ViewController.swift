//
//  ViewController.swift
//  codepath-project2
//
//  Created by Vaibhav on 07/03/23
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies = [[String:Any]]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        guard let url = Bundle.main.url(forResource: "Data", withExtension: ".json") else {return}
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
               print(error.localizedDescription)
        } else if let data = data {
               let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
               
               self.movies = dataDictionary["results"] as! [[String:Any]]
               self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        //cell.textLabel?.text = "row: \(indexPath.row)"
        //cell.textLabel?.text = title
        cell.titleLabel.text = title
        cell.descriptionLabel.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl+posterPath)
        cell.posterLabel.af.setImage(withURL: posterUrl!)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        print("Loading")
        
        let cell =  sender as! UITableViewCell
        let indexPath =  tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
        //Find the selected movie
        //pass the details of the movie view controller
    }
}

