//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 11/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

// Extensión para empaquetar los ViewController y generar UINavigationController
extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}
