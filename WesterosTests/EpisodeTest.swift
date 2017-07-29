//
//  EpisodeTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    // Seasons
    var season1     : Season!
    var season2     : Season!
    
    var episode1x01 : Episode!
    var episode1x02 : Episode!
    var episode1x03 : Episode!
    
    var episode2x01 : Episode!
    var episode2x02 : Episode!
    var episode2x03 : Episode!
    
    
    // Houses
    var starkHouse      : House!
    var lannisterHouse  : House!
    var mormontHouse    : House!
    var targaryenHouse  : House!
    var greyjoyHouse    : House!
    var tyrellHouse     : House!
    
    var robb            : Person!
    var arya            : Person!
    var tyrion          : Person!
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkHouse      = Repository.local.house(named: "Stark")
        lannisterHouse  = Repository.local.house(named: "Lannister")
        
        robb    = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya    = Person(name: "Arya", house: starkHouse)
        tyrion  = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        season1      = Season(number: 1, dateRelease: "2011-04-17", dateFinish: "2011-06-19")
        episode1x01  = Episode(numberOvervall: 1, numberInSeason: 1, title: "Winter Is Coming", season: season1)
        episode1x02  = Episode(numberOvervall: 2, numberInSeason: 2, title: "The Kingsroad", season: season1)
        
        
        episode1x01.add(persons: robb, arya, tyrion)
        episode1x02.add(persons: robb, arya, tyrion)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testPersonExistence() {
        XCTAssertNotNil(episode1x01)
    }
    
    // Test de igualdad
    func testEpisodeEquality() {
        // Identidad
        XCTAssertEqual(episode1x01, episode1x01)
        
        // Igualdad
        let episode1x01bis  = Episode(numberOvervall: 1, numberInSeason: 1, title: "Winter Is Coming", season: season1)
        
        XCTAssertEqual(episode1x01bis, episode1x01)
        
        // Desigualdad
        XCTAssertNotEqual(episode1x01, episode1x02)
        
    }
    
}
