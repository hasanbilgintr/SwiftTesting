//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by hasan bilgin on 29.11.2023.
//

import XCTest

//UI testler burda yazıcaz
final class SwiftTestingUITests: XCTestCase {
    
    //    //testten önce kod çalıştırmak istiyorsak vs
    //    override func setUpWithError() throws {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //
    //        // In UI tests it is usually best to stop immediately when a failure occurs.
    //        continueAfterFailure = false
    //
    //        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    //    }
    //
    //    //buda bittikten sonra yada kapatılabilirde
    //    override func tearDownWithError() throws {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }
    //
    func testExample() throws {
        
        //simulatörü çalıştırıp uygulamayı başlatçak
        let app = XCUIApplication()
        app.launch()
        
    }
    //
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
    //            // This measures how long it takes to launch your application.
    //            measure(metrics: [XCTApplicationLaunchMetric()]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
    
    
    func testToDoItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        //Sol allta Record UI Test yazan yere tıklayıp simülatörde işlem yaparsan otomatik kod yazar tabi en başta fonksiyon içinde tıklanması gerek // çok hatalar veriyo
        //başka fonksiyon yazınca fonksiyon başında kare butonu çıkmazsa command + B yap
        
        
        //Add butonunu tanımladık zaten kodla geldi
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        //.tap() tıklanma
        //addButton.tap()
        
        //Alert açılması
        let elementsQuery = app.alerts["Add İtem"].scrollViews.otherElements
        
        //alert içindeki TextField tanımlanması
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter İtem"]/*[[".cells.textFields[\"Enter İtem\"]",".textFields[\"Enter İtem\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //ok butonu tanımlanması
        let okButton = elementsQuery.buttons["OK"]
        
    
        //app.tables/*@START_MENU_TOKEN@*/.staticTexts["my to do"]/*[[".cells.staticTexts[\"my to do\"]",".staticTexts[\"my to do\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap() yada
        //tıklanmış satırı tanımladık
        let addedCell = app.tables.cells.containing(.staticText,identifier: "my to do").element
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
        
        //en son hücreye toklıyor o hücrenin olması demektir
        XCTAssertTrue(addedCell.exists)

                
    }
    
    func testDeleteItem() throws {

        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        let elementsQuery = app.alerts["Add İtem"].scrollViews.otherElements

        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter İtem"]/*[[".cells.textFields[\"Enter İtem\"]",".textFields[\"Enter İtem\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        let okButton = elementsQuery.buttons["OK"]

        let addedCell = app.tables.cells.containing(.staticText,identifier: "my to do").element
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()

        
       //satırı sola çekmek
        addedCell.swipeLeft()
        
        deleteButton.tap()
        
        //hücre yoksa
        XCTAssertFalse(addedCell.exists)
        
        
        
                        
        
    }
    
}
