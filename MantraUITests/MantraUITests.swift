//
//  MantraUITests.swift
//  MantraUITests
//
//  Created by Karaimchuk on 19.09.21.
//

import XCTest

class MantraUITests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    
    let app = XCUIApplication()
    app.launch()
    
    app.buttons["Join to the World of Mantra"].tap()
    
    let tablesQuery = app.tables
    tablesQuery.staticTexts["What is a mantra?"].tap()
    tablesQuery.staticTexts["What is the power of a mantra?"].tap()
    
    app.tabBars["Tab Bar"].buttons["Mantras"].tap()
    
    app.staticTexts["Mantra Om"].tap()
    app.navigationBars["Mantra.DescriptionView"].buttons["Mantras"].tap()
    
    app.staticTexts["Gayatri Mantra"].tap()
    app.navigationBars["Mantra.DescriptionView"].buttons["Mantras"].tap()
    
    app.tabBars["Tab Bar"].buttons["Subscription"].tap()
    app.buttons["Pay with Pay"].tap()
  }
  
  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
