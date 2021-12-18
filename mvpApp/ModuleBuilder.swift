//
//  Builder.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import Foundation
import UIKit

protocol Builder {
    static func createMain() -> UIViewController
    static func createDetailModule(photo: Photos?) -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMain() -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(photo: Photos?) -> UIViewController {
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkService: networkService, photo: photo)
        view.presenter = presenter
        return view
    }
    
    static func createUserModule() -> UIViewController {
        let networkService = NetworkService()
        let view = UserViewController()
        let presenter = UserPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
