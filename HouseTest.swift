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
    
    // Houses
    var starkHouse      : House!
    var lannisterHouse  : House!
    var mormontHouse    : House!
    var targaryenHouse  : House!
    var greyjoyHouse    : House!
    var tyrellHouse     : House!

    // Sigils
    var starkSigil      : Sigil!
    var lannisterSigil  : Sigil!
    var mormontSigil    : Sigil!
    var targaryenSigil  : Sigil!
    var greyjoySigil    : Sigil!
    var tyrellSigil     : Sigil!

    // Characters
    var robb            = [Person!]()
    var arya            = [Person!]()
    var tyrion          = [Person!]()
    
//    var arrayHouses: Array<House>!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkHouse      = Repository.local.house(named: "Stark")
        lannisterHouse  = Repository.local.house(named: "Lannister")
        mormontHouse    = Repository.local.house(named: "Mormont")
        targaryenHouse  = Repository.local.house(named: "Targaryen")
        greyjoyHouse    = Repository.local.house(named: "Greyjoy")
        tyrellHouse     = Repository.local.house(named: "Tyrell")
        
        starkSigil      = starkHouse.sigil
        lannisterSigil  = lannisterHouse.sigil
        mormontSigil    = mormontHouse.sigil
        targaryenSigil  = targaryenHouse.sigil
        greyjoySigil    = greyjoyHouse.sigil
        tyrellSigil     = tyrellHouse.sigil
      
        robb    = starkHouse.members.filter( { ($0.name == "Robb") })
        arya    = starkHouse.members.filter( { ($0.name == "Arya") })
        
        tyrion  = lannisterHouse.members.filter( { ($0.name == "Tyrion") })
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Caso de test para comprobar que "House" existe y es usable
    func testHouseExistence() {
        // Se comprueba que no sea nil
        XCTAssertNotNil(starkHouse)
        
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
        XCTAssertEqual(starkHouse.countMinorHouse, 0)
        starkHouse.addMinorHouse(house: mormontHouse)
        
        XCTAssertEqual(starkHouse.countMinorHouse, 1)
        starkHouse.addMinorHouse(house: mormontHouse)
        
        XCTAssertEqual(starkHouse.countMinorHouse, 1)
    }
    
    func testEquality() {
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        let jinxed = starkHouse
        
        XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
    }
    
    func testHashable() {
        // hashValue se utiliza para representar ese objeto en un árbol binario
        // y poder meterlo dentro de un "Set"
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison() {
        // Se comprueba si un objeto es mayor que otro
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
}
