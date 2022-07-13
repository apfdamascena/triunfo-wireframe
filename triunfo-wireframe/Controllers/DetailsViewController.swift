//
//  DetailsViewController.swift
//  triunfo-wireframe
//
//  Created by alexdamascena on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movie?.title
    }
}
