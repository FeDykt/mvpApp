//
//  DetailViewController.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setPhotos()
    }

}

extension DetailViewController: DetailViewProtocol {
    func setPhotos(photos: Photos?) {
        labelTitle.text = photos?.title
    }
}
