//
//  DetailPresenter.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setPhotos(photos: Photos?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, photo: Photos?)
    func setPhotos()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var photo: Photos?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, photo: Photos?) {
        self.view = view
        self.networkService = networkService
        self.photo = photo
    }
    
    public func setPhotos() {
        self.view?.setPhotos(photos: photo)
    }
}
