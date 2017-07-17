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
    var robb            : Person!
    var arya            : Person!
    var tyrion          : Person!
    var newStark        : Person!
    
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
      
        robb        = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya        = Person(name: "Arya", house: starkHouse)
        tyrion      = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
    
        newStark    = Person(name: "New", house: starkHouse)
        
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
    
    func testAddPersons(){
        // Se verifica cuantas Person hay en starkHouse
        XCTAssertEqual(starkHouse.count, 5)
        
        // Se añade una nueva persona y se verifica que que se ha incluido
        starkHouse.add(person: newStark)
        XCTAssertEqual(starkHouse.count, 6)
        
        // Se añade intenta añadir una persona que ya está dada de alta y se verifica que no la incluye
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 6)
        
        // Se añade intenta añadir una persona que no es de Stark y se verifica que no la incluye
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 6)
    }
    
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
