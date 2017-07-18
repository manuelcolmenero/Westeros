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

        title       = "Westeros"
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
    
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Se crea el identificador de celda
        let cellID = "HouseCell"
        
        // Se averiguar cual es el objeto House que se ha de mostrar
        let house = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default,
                                   reuseIdentifier: cellID)
        }
        
        // Sincronizar House -> Cell
        cell?.imageView?.image  = house.sigil.image
        cell?.textLabel?.text   = house.name
        
        return cell!
    }
    
    
    // MARK: - Table View Controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Se averigua la celda 
        let house   = model[indexPath.row]
        
        // Se muestra la celda
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }
}
