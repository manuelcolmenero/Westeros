//
//  HouseTest.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 6/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTest: XCTestCase {
    // Se obtienen los modelos
    let houses = Repository.local.houses
    
    var starkHouse      = [House!]()
    var lannisterHouse  = [House!]()
    var mormontHouse    = [House!]()
    
    var starkSigil      : Sigil!
    var lannisterSigil  : Sigil!
    var mormontSigil    : Sigil!
    
    var robb            = [Person!]()
    var arya            = [Person!]()
    var tyrion          = [Person!]()
    
//    var arrayHouses: Array<House>!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkHouse      = houses.filter { ($0.name == "Stark") }
        lannisterHouse  = houses.filter { ($0.name == "Lannister") }
        mormontHouse    = houses.filter { ($0.name == "Mormont") }
        
        starkSigil      = starkHouse[0].sigil
        lannisterSigil  = lannisterHouse[0].sigil
        mormontSigil    = mormontHouse[0].sigil
      
        robb    = starkHouse[0].members.filter( { ($0.name == "Roob") })
        arya    = starkHouse[0].members.filter( { ($0.name == "Arya") })
        tyrion  = lannisterHouse[0].members.filter( { ($0.name == "Tyrion") })
        
//        arrayHouses = Array.init()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Caso de test para comprobar que "House" existe y es usable
    func testHouseExistence() {
        // Se comprueba que no sea nil
        XCTAssertNotNil(starkHouse[0])
        
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(starkSigil)
        
        XCTAssertNotNil(lannisterSigil)
    }
    
//    func testAddPersons(){
//        XCTAssertEqual(starkHouse[0].count, 0)
//        starkHouse[0].add(person: robb[0])
//        
//        XCTAssertEqual(starkHouse[0].count, 1)
//        starkHouse[0].add(person: arya[0])
//        
//        XCTAssertEqual(starkHouse[0].count, 2)
//        
//        starkHouse[0].add(person: tyrion[0])
//        XCTAssertEqual(starkHouse[0].count, 2)
//    }
    
    func testAddMinorHouse() {
        XCTAssertEqual(starkHouse[0].countMinorHouse, 0)
        starkHouse[0].addMinorHouse(house: mormontHouse[0])
        
        XCTAssertEqual(starkHouse[0].countMinorHouse, 1)
        starkHouse[0].addMinorHouse(house: mormontHouse[0])
        
        XCTAssertEqual(starkHouse[0].countMinorHouse, 1)
    }
    
    func testEquality() {
        // Identidad
        XCTAssertEqual(starkHouse[0], starkHouse[0])
        
        // Igualdad
        let jinxed = starkHouse[0]
        
        XCTAssertEqual(jinxed, starkHouse[0])
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse[0], lannisterHouse[0])
        
    }
    
    func testHashable() {
        // hashValue se utiliza para representar ese objeto en un árbol binario
        // y poder meterlo dentro de un "Set"
        XCTAssertNotNil(starkHouse[0].hashValue)
    }
    
    func testHouseComparison() {
        // Se comprueba si un objeto es mayor que otro
        XCTAssertLessThan(lannisterHouse[0], starkHouse[0])
    }
}
