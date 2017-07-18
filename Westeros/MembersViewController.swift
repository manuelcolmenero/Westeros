//
//  MembersViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class MembersViewController: UITableViewController {

    
    // Propiedad para el modelo
    let model : [Person]
    
    init (model: [Person]) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)
        
        title       = "Members"
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
        let cellID = "PersonCell"
        
        // Se averiguar cual es el objeto House que se ha de mostrar
        let person = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default,
                                   reuseIdentifier: cellID)
        }
        
        // Sincronizar House -> Cell
        cell?.textLabel?.text   = person.fullName
        
        return cell!
    }

    
}
