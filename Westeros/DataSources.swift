//
//  DataSources.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

// Se crea una clase de repositorio de objetos
final class DataSources{
    
    // Función que construye un array de DataSource de casas
    static func houseDataSource(model: [House]) -> ArrayDataSource<House>{
        return ArrayDataSource(model: model, cellMaker: { (house: House, UITableView: UITableView) -> UITableViewCell in
            let cellID = "House"
            var cell    = UITableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            
            return cell!
        })
    }
    
    // Función que construye un array de DataSource de casas
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person>{
        return ArrayDataSource(model: model, cellMaker: { (person: Person, UITableView: UITableView) -> UITableViewCell in
            let cellID = "Person"
            var cell    = UITableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            
            return cell!
        })
    }
}
