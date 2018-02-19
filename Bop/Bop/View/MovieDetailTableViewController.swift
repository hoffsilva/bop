//
//  MovieDetailTableViewController.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 18/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import Hero
import SDWebImage

class MovieDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    let moviesListViewModel = MoviesListViewModel()
    var movie = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDataMovieInFields()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    @IBAction func closeDetail() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "moviesList")
        Hero.shared.defaultAnimation = .zoomOut
        Hero.shared.animate()
        hero_replaceViewController(with: vc)
    }
    
    func setDataMovieInFields() {
        titleLabel.text = movie.title ?? ""
        releaseDateLabel.text = movie.releaseDate ?? ""
        overviewTextView.text = movie.overview ?? ""
        setTableViewBackground()
    }
    
    func setTableViewBackground() {
        let view = UIImageView(frame: tableView.frame)
        view.sd_setImage(with: URL(string: "\(ConstantsUtil.defaultPosterURL())\(movie.posterPath ?? "")"), completed: nil)
        view.contentMode = .scaleAspectFill
        view.alpha = 0.3
        tableView.backgroundView = view
    }
}

extension MovieDetailTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (movie.genreIds?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCollectionViewCell", for: indexPath) as! GenresListCollectionViewCell
        
        cell.genreImageView.image = UIImage(imageLiteralResourceName: "\(String(describing: movie.genreIds![indexPath.row]))")
        
        return cell
    }
}
