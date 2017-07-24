//
//  Season.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import Foundation
import UIKit

typealias Chapters = Set<Episode>

final class Season{
    let number         : Int
    let dateRelease    : String
    let dateFinish     : String
    
    private var _chapters : Chapters
    
    init(number: Int, dateRelease: String, dateFinish: String) {
        (self.number, self.dateRelease, self.dateFinish) = (number, dateRelease, dateFinish)
        _chapters = Chapters()
    }
}

// MARK: - Extension
extension Season{
    
    // Extension de propiedad
    var count : Int{
        return _chapters.count
    }
    
    // Extension de método
    func add(episode: Episode) {
        
        guard episode.season.number == number else {
            return
        }
        
        _chapters.insert(episode)
    }
    
    // Sobrecarga de funciones. Se crea la misma función con distintos parámetros
    
    // Los '...' son Variadic versión. Quiere decir que puede recibir varios parámetros separados por comas.
    func add(episodes: Episode...){
        for episode in episodes{
            add(episode: episode)
        }
    }
    
    // se pasa como parámetro un array
    func add(episodesArray: [Episode]){
        for episode in episodesArray{
            add(episode: episode)
        }
    }
    
    // Sorted [Episode]
    // Se crea un metodo que devuelve un array de personas
    func sortedChapters() -> [Episode]{
        return _chapters.sorted()
    }
}


// MARK: - Proxy
extension Season {
    
    // Variable para igualdad de objetos
    var proxyForEquality: String {
        get {
            return "\(number)"
        }
    }
    
    
    // Variable para ordenar objetos
    var proxyForComparison: Int {
        get {
            return number
        }
    }
}

// MART_ - Hashable
extension Season: Hashable {
    var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

// MART_ - Equatable
extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MART_ - Comparable
extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}