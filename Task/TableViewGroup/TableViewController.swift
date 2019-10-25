//
//  TableViewController.swift
//  Task
//
//  Created by Nazar Kovalik on 14.9.2019.
//  Copyright © 2019 Nazar Kovalik. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(TableViewController.populate), for: UIControl.Event.valueChanged)
        tableView.addSubview(refresher)
        request()
        setupNavigationBar()
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @objc func populate(){
       
        tableView.reloadData()
         refresher.endRefreshing()
    }
    func setupNavigationBar()  {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count - 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let indexPath = textArray[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.year.text = indexPath.years
        cell.tempMax.text = indexPath.tmax
        cell.tempMin.text = indexPath.tmin
        cell.month.text = indexPath.month
         return cell
     }
}

