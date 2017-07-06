//
//  House.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 6/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import UIKit

// Representación del módelo
// MARK: - typealias
typealias Words = String

// MARK: - Classes
final class House{
    let name    : String
    let sigil   : Sigil
    let words   : Words
    
    init(name : String, sigil : Sigil, words : Words) {
        (self.name, self.sigil, self.words) = (name, sigil, words)
    }
}

final class Sigil{
    let description : String
    let image       : UIImage
    
    init(image : UIImage, description : String) {
        (self.image, self.description) = (image, description)
    }
    
}
