import XCTest

class MyPlacesUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--UITesting")
        app.launch()
    }
    override func tearDownWithError() throws {
    }

    func testCreateAndDeletePlaceTest() throws {
        
        XCTAssertTrue(app.isOnMainView)
        app.navigationBars["My Places"].buttons["Add"].tap()
        app.textFields["Place name"].tap()
        app.textFields["Place name"].typeText("Fish")
        app/*@START_MENU_TOKEN@*/.textFields["Place location"]/*[[".cells.textFields[\"Place location\"]",".textFields[\"Place location\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Place location"]/*[[".cells.textFields[\"Place location\"]",".textFields[\"Place location\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("2915 yale ave")
        app/*@START_MENU_TOKEN@*/.textFields["Place type"]/*[[".cells.textFields[\"Place type\"]",".textFields[\"Place type\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Place type"]/*[[".cells.textFields[\"Place type\"]",".textFields[\"Place type\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText("Bar")
     //   XCTAssertFalse(app.isOnMainView)
        app.navigationBars["New Place"].buttons["Save"].tap()
        XCTAssertTrue(app.tables.staticTexts["Fish"].exists)
        XCTAssertTrue(app.tables.staticTexts["2915 yale ave"].exists)
        XCTAssertTrue(app.tables.staticTexts["Bar"].exists)
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        app/*@START_MENU_TOKEN@*/.tables.buttons["Delete"]/*[[".otherElements[\"mainView\"].tables",".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
    }
    func testSearchBox() throws {
        app.navigationBars["My Places"].searchFields["Search"].tap()
        app.navigationBars["My Places"].searchFields["Search"].typeText("Al")
        XCTAssertTrue(app.staticTexts["Alibaba"].exists)
    }
}
extension XCUIApplication {
    var isOnMainView: Bool {
        return otherElements["mainView"].exists
    }
}
