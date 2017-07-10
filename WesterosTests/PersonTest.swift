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
    
    // "!" significa que puede contener algo o nil
    // Se declara fuera de setUp para que sea variable global
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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
