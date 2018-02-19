//
//  GenresListCollectionViewController.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 18/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class GenresListCollectionViewController: UICollectionViewController {

    let moviesListViewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return moviesListViewModel.genreIds().count
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GenresListCollectionViewCell
    
//        cell.genreImageView.image = UIImage(imageLiteralResourceName: "\(String(describing: moviesListViewModel.genreIds()[indexPath.row]))")
    
        return cell
    }

}
