//
//  NetworkService.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func getRequest(_ completion: @escaping (Result<[Photos],Error>) -> Void)
    func getUsers(_ completion: @escaping (Result<[Users], Error>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
    let urlUsers = "https://jsonplaceholder.typicode.com/users"
    let urlPhotos = "https://jsonplaceholder.typicode.com/photos"
    
    func getUsers(_ completion: @escaping (Result<[Users], Error>) -> Void) {
        AF.request(urlUsers).validate().responseDecodable(of: [Users].self) { response in
            guard let value = response.value else { return }
            completion(.success(value))
        }
    }
    
    func getRequest(_ completion: @escaping (Result<[Photos], Error>) -> Void) {
        AF.request(urlPhotos).validate().responseDecodable(of: [Photos].self) { response in
            guard let value = response.value else { return }
            completion(.success(value))
        }
    }
    
}
