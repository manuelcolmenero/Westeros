//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

// Se crea una clase genérica que implementa el DataSource de TableView
// Se hereda de NSObject para tener implementado todo aquello común
final class ArrayDataSource<Element> : NSObject, UITableViewDataSource {
    
    // Se crea la variable para usar el tipo genérico para usar en el código
    typealias Elements  = [Element]
    
    // Se crea un typealias para la clausura necesaria para recibir las 
    // indicaciones necesarias para crear una celda
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    // Se crea una variable privada de tipo Array de variable genérica
    private let _model      : Elements
    
    // Variable para guardar la clausura
    private let _cellMaker  : CellMaker
    
    // Se especifica que la clausura se puede "escapar" (@escaping) por 
    // requisito del compilador
    init(model: Elements, cellMaker: @escaping CellMaker) {
        _model      = model
        _cellMaker  = cellMaker
        
        super.init()
    }
    
    // Tantas filas como registros hay en el modelo
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    // Se crea la celda
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elt = _model[indexPath.row]
        return _cellMaker(elt, tableView)
        
    }

    
}
