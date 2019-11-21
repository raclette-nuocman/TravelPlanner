//
//  TableViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

class TripListTableViewController: UITableViewController {

    private var dataSource: TripDataSource!
    
    var deinitBlock: (() -> Void)?
    var selectionBlock: ((Trip) -> Void)?

    convenience init(dataSource: TripDataSource, deinitBlock: @escaping () -> Void) {
        self.init(style: .plain)
        self.dataSource = dataSource
    }
    
    deinit {
        deinitBlock?()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        title = "Your trips"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.allTrips.count
    }

    private func registerCells() {
        tableView.register(UINib(nibName: "TripListTableViewCell", bundle: nil), forCellReuseIdentifier: "TripListTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TripListTableViewCell.identifier, for: indexPath) as! TripListTableViewCell
        cell.setup(with: dataSource.allTrips[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = dataSource.allTrips[indexPath.row]
        selectionBlock?(trip)
    }

}
