//
//  PopularCollectionViewCell.swift
//  triunfo-wireframe
//
//  Created by alexdamascena on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "popular-cell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func  draw(_ element: Movie){
        titleLabel.text = element.title
        image.image = UIImage()
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: element.backdropPath)
            let image = UIImage(data: imageData)
            self.image.image = image
        }

    }

}
