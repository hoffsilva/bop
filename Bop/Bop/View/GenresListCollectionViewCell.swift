//
//  GenresListCollectionViewCell.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 17/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class GenresListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genreImageView: UIImageView!
    
}

extension GenresListCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCollectionViewCell", for: indexPath) as! GenresListCollectionViewCell
        cell.genreImageView.image = #imageLiteral(resourceName: "bg_table_view")
        return cell
    }
}
