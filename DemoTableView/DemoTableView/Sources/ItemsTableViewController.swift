//
//  ItemsTableViewController.swift
//  DemoTableView
//
//  Created by Hernan Aldunate on 28/10/18.
//  Copyright © 2018 Hernan Aldunate. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    private var dataModels = [BaseCellModel]()
    private var dataSource = ItemsDataSource()
    private var selectedItem: IndexPath?
    
    // MARK: - Table view setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() //To prevent showing separators between empty cells
        refreshControl?.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        
        navigationItem.title = dataSource.title
        dataSource.registerCellsIn(tableView: tableView)
        
        if let refreshControl = refreshControl {
            tableView.setContentOffset(CGPoint(x: 0, y: -refreshControl.frame.size.height), animated: true)
            refreshControl.beginRefreshing()
        }

        fetchData()
    }
    
    // MARK: - Table view data handling
    
    private func fetchData() {
        dataSource.fetchData(success: {
            [weak self] dataModels in
            guard let strongSelf = self else { return }
            
            strongSelf.showDataWith(dataModels: dataModels)
            }, failure: {
                [weak self] error in
                guard let strongSelf = self else { return }
                
                strongSelf.showError()
                
                if let error = error {
                    print(error)
                }
        })
    }
    
    private func reloadTableViewWith(dataModels: [BaseCellModel]) {
        refreshControl?.endRefreshing()
        self.dataModels = dataModels
        tableView.reloadData()
    }
    
    private func showDataWith(dataModels: [BaseCellModel]) {
        tableView.backgroundView = nil
        reloadTableViewWith(dataModels: dataModels)
    }
    
    private func showError() {
        let errorView = ErrorView.fromNib()
        errorView.message = "Data could not be retrieved"
        tableView.backgroundView = errorView
        reloadTableViewWith(dataModels: [BaseCellModel]())
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        fetchData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataModels[indexPath.row]
        let cell = model.cellIn(tableView: tableView, at: indexPath)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = indexPath
        performSegue(withIdentifier: "ShowItemDetail", sender: self)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController, let selectedItem = selectedItem else { return }
        
        let model = dataModels[selectedItem.row]
        let cell = model.cellIn(tableView: tableView, at: selectedItem)
        dataSource.setup(detailController: detailViewController, for: cell)
    }
}
