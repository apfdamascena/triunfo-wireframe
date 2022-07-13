//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  triunfo-wireframe
//
//  Created by alexdamascena on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let movie: Movie = collectionView == self.popularCollectionView ?
                           popularMovies[index] : nowPlayingMovies[index]
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
        
    }
}
