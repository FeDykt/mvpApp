//
//  Presenter.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getPhotos()
    var photos: [Photos]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var photos: [Photos]?
    
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPhotos()
    }
    
    func getPhotos() {
        networkService.getRequest { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.photos = success
                DispatchQueue.main.async {
                    self.view?.success()
                }
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
}
