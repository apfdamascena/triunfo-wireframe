//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  triunfo-wireframe
//
//  Created by alexdamascena on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        }
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        if collectionView == popularCollectionView {
            if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell {
                let index = indexPath.row
                let movie = popularMovies[index]
                cell.draw(movie)
                return cell
            }
        } else if collectionView == nowPlayingCollectionView {
            if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell {
                let index = indexPath.row
                let movie = nowPlayingMovies[index]
                cell.draw(movie)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}
