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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
    }
}

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teste", for: indexPath) as? PopularCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.titleLabel.text = "titulo de filme"
        cell.image.image = UIImage()
        
        return cell
    }
}

