//
//  MainPresenterTest.swift
//  mvpAppTests
//
//  Created by fedot on 18.12.2021.
//

import XCTest
@testable import mvpApp

class MockView: MainViewProtocol {
    let tableView = UITableView()
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

class MainPresenterTest: XCTestCase {
    var view: MockView!
    var networkService: NetworkService!
    var presenter: MainPresenter!
    
    override func setUp() {
        view = MockView()
        networkService = NetworkService()
        presenter = MainPresenter(view: view, networkService: networkService)
    }
    
    override func tearDown() {
        view = nil
        networkService = nil
        presenter = nil
    }
    
    func testModelIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(networkService, "networkservice is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }

}
