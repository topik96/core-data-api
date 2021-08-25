//
//  ViewController.swift
//  core-data-api
//
//  Created by Topik Mujianto on 24/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        Repository.doGetUserList { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        cell.nameLbl.text = user.name
        cell.userNameLbl.text = user.email
        cell.AddressLbl.text = "\(user.address?.street ?? ""), \(user.address?.city ?? ""), \(user.address?.geo?.latitude ?? ""), \(user.address?.geo?.longitude ?? "")"
        return cell
    }
    
    
}
