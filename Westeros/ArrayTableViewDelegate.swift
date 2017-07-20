//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate{
    
    typealias Elements = [Element]
    
    let model : Elements
    
    init(model: Elements){
        self.model = model
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Qué pasa aquí dentro?
        
    }
    
}
