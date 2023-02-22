//
//  ViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 10/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    // MARK: - customer Demo data
    let customerData = AddNewBeneficiaryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setConstraints()
    }
    
    // MARK: - setConstraints
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
}

// MARK: - Table view controller delegate and datasource
extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let customerData = customerData
        cell.textLabel?.text = "\(customerData.bnkSltTextLabel.text!), \(customerData.sltAccTypeTextLabel.text!)"
        return cell
    }
}
