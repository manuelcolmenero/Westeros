//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate{
    
    typealias Elements                 = [Element]
    typealias ViewControllerMaker      = (Element) -> (UIViewController)

    private let _model                 : Elements
    private let _viewControllerMaker   : ViewControllerMaker
    
    
    init(model: Elements, viewControllerMaker: @escaping ViewControllerMaker){
        self._model                    = model
        self._viewControllerMaker      = viewControllerMaker
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Qué pasa aquí dentro?
        let elt   = _model[indexPath.row]
        
        _viewControllerMaker(elt)
        
        
    }
    
}
