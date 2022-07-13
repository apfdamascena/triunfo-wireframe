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
            view.showsHorizontalScrollIndicator = false
            view.delegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsViewController = segue.destination as? DetailsViewController else { return }
        guard let movie = sender as? Movie else { return }
        detailsViewController.movie = movie
    }
}

