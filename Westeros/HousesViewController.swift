//
//  HousesViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 17/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class HousesViewController: UITableViewController {

    // Propiedad para el modelo
    let model : [House]
    
    init (model: [House]) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)

        title       = "Houses"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    // MARK: - Table View Controller
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // Se averigua la celda 
        let house   = model[indexPath.row]
        
        // Se muestra la celda
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }
}
