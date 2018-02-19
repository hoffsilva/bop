//
//  MoviesListTableViewController.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 17/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import SDWebImage
import Hero

class MoviesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var moviesListTableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    
    var currentMovie: Int!
    let moviesListViewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesListTableView.delegate = self
        moviesListTableView.dataSource = self
        moviesSearchBar.delegate = self
        setTableViewBackground()
        moviesListViewModel.delegate = self
        moviesListViewModel.loadMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesListViewModel.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height - 60
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesListTableViewCell", for: indexPath) as! MoviesListTableViewCell
        moviesListViewModel.currentMovie = indexPath.row
        cell.genresListCollectionView.delegate = self
        cell.genresListCollectionView.dataSource = self
        cell.posterImageView.sd_setImage(with: URL(string: "\(ConstantsUtil.defaultPosterURL())\(moviesListViewModel.movieObject().posterPath ?? "")"), completed: nil)
        cell.movieTitleLabel.text = moviesListViewModel.movieObject().title ?? ""
        cell.releaseDateLabel.text = moviesListViewModel.movieObject().releaseDate ?? ""
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMovie" {
            let detailMovie = segue.destination as! MovieDetailTableViewController
            detailMovie.movie = moviesListViewModel.movieObject()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesListViewModel.currentMovie = indexPath.row
        performSegue(withIdentifier: "detailMovie", sender: self)
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "movieDetail")
        Hero.shared.defaultAnimation = .zoom
        Hero.shared.animate()
        hero_replaceViewController(with: vc)
    }

    @IBAction func changeLanguage() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "changeLanguage")
        Hero.shared.defaultAnimation = .zoomSlide(direction: HeroDefaultAnimationType.Direction.left)
        Hero.shared.animate()
        hero_replaceViewController(with: vc)
    }
    

}

extension MoviesListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return moviesListViewModel.movieObject().genreIds?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCollectionViewCell", for: indexPath) as! GenresListCollectionViewCell
        
        cell.genreImageView.image = UIImage(imageLiteralResourceName: "\(String(describing: moviesListViewModel.genreIds()[indexPath.row]))")
        
        return cell
    }
}

extension MoviesListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

extension MoviesListViewController: MoviesListDelegate {
    func didFinishLoading() {
        moviesListTableView.reloadData()
    }
    
    func didFailLoading(with errorMessage: String, code errorCode: Int?) {
        print(errorMessage)
    }
}


extension MoviesListViewController {
    
    func setTableViewBackground() {
        let view = UIImageView(frame: moviesListTableView.frame)
        view.image = #imageLiteral(resourceName: "bg_table_view")
        view.contentMode = .scaleAspectFill
        view.alpha = 0.3
        moviesListTableView.backgroundView = view
    }
}
