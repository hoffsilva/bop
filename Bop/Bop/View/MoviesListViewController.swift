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
        cell.genresListCollectionView.delegate = self
        cell.genresListCollectionView.dataSource = self
        cell.posterImageView.sd_setShowActivityIndicatorView(true)
        cell.posterImageView.sd_setImage(with: URL(string: moviesListViewModel.posterPath()), completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCollectionViewCell", for: indexPath)
        
        // Configure the cell
        
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
