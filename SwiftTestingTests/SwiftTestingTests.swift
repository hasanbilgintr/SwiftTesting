//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by hasan bilgin on 29.11.2023.
//

import XCTest
@testable import SwiftTesting

//unit testler için yazıcaz burda
//XCTestCase testler için bir sınıf
final class SwiftTestingTests: XCTestCase {

//    //testten önce kod çalıştırmak istiyorsak vs
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    //buda bittikten sonra yada kapatılabilirde
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    //bölede yazılabilir biz kendimizi yazıcaz
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    let math = MathematicFunctions()
    
    //testFonksiyonAdıFunction() diye genelde konurmuş
    //fonksiyon başındaki kare ile başlatabiliriz //sınıftanda başlatabiliriz
    func testaddIntegersFunction(){
        
        let result = math.addIntegers(x: 5, y: 8)
        
        //XCTAssert(<#T##expression: Bool##Bool#>) ya olsun yada herşeyi çökert manasında // doğruysa test geçicek yanlışsa geçemeyecek
        //XCTAssertTrue(<#T##expression: Bool##Bool#>) doğrumu değilmi bak
        //XCTAssertFalse(<#T##expression: Bool##Bool#>) yanlışmı değilmi bak
        //XCTAssertEqual(<#T##expression: Bool##Bool#>) eşitmi değilmi bak
        //XCTAssertNotNil(<#T##expression: Bool##Bool#>) nil değilmi bak
        //XCTAssertLessThan(<#T##expression: Bool##Bool#>) bundan küçük olduğundna emin ol
        //XCTAssertNotEqual(<#T##expression: Bool##Bool#>) eşitmio lmadığından emin ol
        //XCTAssertGreaterThan(<#T##expression: Bool##Bool#>) bundan büyük olduğundna emin ol
        XCTAssertEqual(result, 13)
       
        
    }
    
    func testMultilyNumberFunction(){
        let result = math.multilyNumber(x: 5, y: 8)
        XCTAssertEqual(result, 40)

    }
    
    func testDivideIntegersFunction(){
        let result = math.divideIntegers(x: 10, y: 2)
        XCTAssertEqual(result, 5)

    }
    
    

}
