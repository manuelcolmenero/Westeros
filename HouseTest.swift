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
    
    var starkImage      : UIImage!
    var lannisterImage  : UIImage!
    var mormontImage    : UIImage!
    
    var starkSigil      : Sigil!
    var lannisterSigil  : Sigil!
    var mormontSigil    : Sigil!
    
    var starkHouse      : House!
    var lannisterHouse  : House!
    var mormontHouse    : House!
    
    var robb            : Person!
    var arya            : Person!
    var tyrion          : Person!
    
//    var arrayHouses: Array<House>!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        mormontImage = #imageLiteral(resourceName: "mormotSigil.png")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant lion")
        mormontSigil = Sigil(image: mormontImage, description: "Rampant bear")

        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        mormontHouse = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
//        arrayHouses = Array.init()
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
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
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
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        
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
