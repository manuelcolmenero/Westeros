//
//  CharacterTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 6/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
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
        mormontHouse    = Repository.local.house(named: "Mormont")
        targaryenHouse  = Repository.local.house(named: "Targaryen")
        greyjoyHouse    = Repository.local.house(named: "Greyjoy")
        tyrellHouse     = Repository.local.house(named: "Tyrell")
        
        robb    = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya    = Person(name: "Arya", house: starkHouse)
        tyrion  = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName() {
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    // Test de igualdad
    func testPersonEquality() {
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
}
