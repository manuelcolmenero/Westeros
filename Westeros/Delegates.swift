//
//  Delegates.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

final class Delegates{
    
    static func housesDelegate(model: [House])->ArrayTableViewDelegate<House>{
        return ArrayTableViewDelegate(model: model, viewControllerMaker: { (house: House) -> UIViewController in
        
            return HouseViewController(model: house)
        })
    }
}
