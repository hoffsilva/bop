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
    
    
    

}


