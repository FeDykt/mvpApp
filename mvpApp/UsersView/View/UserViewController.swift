//
//  UserViewController.swift
//  mvpApp
//
//  Created by fedot on 19.12.2021.
//

import UIKit

class UserViewController: UIViewController {
    let tableView = UITableView()
    let identifier = "Cell"
    var presenter: UsersViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.frame = view.frame
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }

}

extension UserViewController: UsersViewProtocol {
    func success() {
        self.tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.users?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let users = presenter.users?[indexPath.row]
        cell.textLabel?.text = users?.username
        return cell
    }
}
