//
//  NowPlayingCollectionViewCell.swift
//  triunfo-wireframe
//
//  Created by alexdamascena on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "now-playing-cell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func draw(_ element: Movie){
        image.image = UIImage(named: element.posterPath)
        titleLabel.text = element.title
        dateLabel.text = String(element.releaseDate.prefix(4))
    }
}
