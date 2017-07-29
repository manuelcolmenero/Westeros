//
//  SeasonTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 23/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    // Seasons
    var season1     : Season!
    var season2     : Season!
    
    var episode1x01 : Episode!
    var episode1x02 : Episode!
    var episode1x03 : Episode!

    var episode2x01 : Episode!
    var episode2x02 : Episode!
    var episode2x03 : Episode!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.


        season1      = Season(number: 1, dateRelease: "2011-04-17", dateFinish: "2011-06-19")
        episode1x01  = Episode(numberOvervall: 1, numberInSeason: 1, title: "Winter Is Coming", season: season1)
        episode1x02  = Episode(numberOvervall: 2, numberInSeason: 2, title: "The Kingsroad", season: season1)
        episode1x03  = Episode(numberOvervall: 3, numberInSeason: 3, title: "Lord Snow", season: season1)
        
        season2      = Season(number: 2, dateRelease: "2012-04-01", dateFinish: "2012-06-03")
        episode2x01  = Episode(numberOvervall: 11, numberInSeason: 1, title: "The North Remembers", season: season2)
        episode2x02  = Episode(numberOvervall: 12, numberInSeason: 2, title: "The Night Lands", season: season2)
        episode2x03  = Episode(numberOvervall: 13, numberInSeason: 3, title: "What Is Dead May Never Die", season: season2)
    
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Caso de test para comprobar que "Season" existe y es usable
    func testSeasonExistence() {
        // Se comprueba que no sea nil
        XCTAssertNotNil(season1)
        
    }
    
    // Caso de test para añadir "Episodes" a "Seasons"
    func testAddChapters(){
        // Se verifica cuantos Episodes hay en Season1
        XCTAssertEqual(season1.count, 0)
        
        season1.add(episodes: episode1x01)
        XCTAssertEqual(season1.count, 1)
        
        
    }
    
    func testEquality() {
        // Identidad
        XCTAssertEqual(season1, season1)
        
        // Igualdad
        let jinxed = season1
        
        XCTAssertEqual(jinxed, season1)
        
        // Desigualdad
        XCTAssertNotEqual(season1, season2)
        
    }
    
    func testHashable() {
        // hashValue se utiliza para representar ese objeto en un árbol binario
        // y poder meterlo dentro de un "Set"
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testHouseComparison() {
        // Se comprueba si un objeto es mayor que otro
        XCTAssertLessThan(season1, season2)
    }
    
}
