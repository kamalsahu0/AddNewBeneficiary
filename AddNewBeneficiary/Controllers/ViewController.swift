//
//  ViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 10/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let customerData = [
        DataModel(selectBank: "Sbi", accNumber: "823832837424", confAccNumber: "823832837424", nickName: "Kamal", benName: "Kamal sahu", selectAccType: "Saving"),
        DataModel(selectBank: "Sbi", accNumber: "823832837424", confAccNumber: "823832837424", nickName: "Kamal", benName: "Kamal sahu", selectAccType: "Saving"),
        DataModel(selectBank: "Sbi", accNumber: "823832837424", confAccNumber: "823832837424", nickName: "Kamal", benName: "Kamal sahu", selectAccType: "Saving"),
        DataModel(selectBank: "Sbi", accNumber: "823832837424", confAccNumber: "823832837424", nickName: "Kamal", benName: "Kamal sahu", selectAccType: "Saving"),
        DataModel(selectBank: "Sbi", accNumber: "823832837424", confAccNumber: "823832837424", nickName: "Kamal", benName: "Kamal sahu", selectAccType: "Saving")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setConstraints()
    }

    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let customerData = customerData[indexPath.row]
        cell.textLabel?.text = "\(customerData.selectBank), \(customerData.accNumber), \(customerData.nickName), \(customerData.benName), \(customerData.selectAccType)"
        return cell
    }
}
