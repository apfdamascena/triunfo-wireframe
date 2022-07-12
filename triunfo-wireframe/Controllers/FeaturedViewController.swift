//
//  FeaturedViewController.swift
//  triunfo-wireframe
//
//  Created by alexdamascena on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {

    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let views: [UICollectionView] = [popularCollectionView, nowPlayingCollectionView]
        
        views.forEach{ view in
            view.dataSource = self
            view.delegate = self
            view.showsHorizontalScrollIndicator = false
        }
    }
}

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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

