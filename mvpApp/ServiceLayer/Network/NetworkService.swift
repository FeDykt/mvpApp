//
//  NetworkService.swift
//  mvpApp
//
//  Created by fedot on 18.12.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getRequest(_ completion: @escaping (Result<[Photos],Error>) -> Void)
    func getUsers(_ completion: @escaping (Result<[Users], Error>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
    func getUsers(_ completion: @escaping (Result<[Users], Error>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error { completion(.failure(error)); return }
            do {
                let obj = try JSONDecoder().decode([Users].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getRequest(_ completion: @escaping (Result<[Photos], Error>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error { completion(.failure(error)); return }
            do {
                let obj = try JSONDecoder().decode([Photos].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
