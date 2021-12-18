//
//  Presenter.swift
//  mvpApp
//
//  Created by fedot on 19.12.2021.
//

import UIKit

protocol UsersViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol UsersViewPresenterProtocol: AnyObject {
    init(view: UsersViewProtocol, networkService: NetworkServiceProtocol)
    func getUsers()
    var users: [Users]? { get set }
}

class UserPresenter: UsersViewPresenterProtocol {
    weak var view: UsersViewProtocol?
    let networkService: NetworkServiceProtocol
    var users: [Users]?
    
    
    required init(view: UsersViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getUsers()
    }
    
    func getUsers() {
        networkService.getUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.users = success
                DispatchQueue.main.async {
                    self.view?.success()
                }
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
}
