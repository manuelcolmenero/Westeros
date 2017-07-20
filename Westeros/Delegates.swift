//
//  Delegates.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 18/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

final class Delegates{
    
    static func housesDelegate(model: [House],
                               nav  : UINavigationController)->ArrayTableViewDelegate<House>{
        
        
        return ArrayTableViewDelegate(model: model,
                                      viewControllerMaker: { (house: House) -> () in
        
            let houseVC =  HouseViewController(model: house)
            nav.pushViewController(houseVC, animated: true)
        })
    }
}
