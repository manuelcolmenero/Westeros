//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {
    
    let dataSource : ArrayDataSource<Element>
    
    
    
    init(dataSource: ArrayDataSource<Element>, title: String, style: UITableViewStyle){
        
        self.dataSource = dataSource
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
