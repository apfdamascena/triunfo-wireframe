//
//  DetailsViewController.swift
//  triunfo-wireframe
//
//  Created by alexdamascena on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else { return }
        self.title = movie.title
        backdropImage.image = UIImage()
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        posterImage.image = UIImage()
        overviewLabel.text = movie.overview
//
//        let imageData = await Movie.downloadImageData(withPath: element.backdropPath)
//        let image = UIImage(data: imageData)
//        self.image.image = image
        
        Task {
            let backdropImage = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imageBackdrop = UIImage(data: backdropImage)
            self.backdropImage.image = imageBackdrop
            
            let postImage = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagePost = UIImage(data: postImage)
            self.posterImage.image = imagePost
        }
    }
}
