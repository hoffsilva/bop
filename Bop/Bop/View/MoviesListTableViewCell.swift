//
//  MoviesListTableViewCell.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 17/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresListCollectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MoviesListTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        genresListCollectionView.delegate = dataSourceDelegate
        genresListCollectionView.dataSource = dataSourceDelegate
        genresListCollectionView.tag = row
        genresListCollectionView.setContentOffset(genresListCollectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        genresListCollectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { genresListCollectionView.contentOffset.x = newValue }
        get { return genresListCollectionView.contentOffset.x }
    }
}

