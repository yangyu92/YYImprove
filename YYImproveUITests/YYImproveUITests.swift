//
//  YYImproveUITests.swift
//  YYImproveUITests
//
//  Created by yuyangstudio on 2018/4/27.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import XCTest

class YYImproveUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sleep(1)
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.children(matching: .window)
            .element(boundBy: 0).children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .other)
            .element.children(matching: .button)
            .element(boundBy: 0).tap()
        
        let textField = app.textFields["请输入手机号"]
        textField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["清除文本"]/*[[".textFields[\"请输入手机号\"].buttons[\"清除文本\"]",".buttons[\"清除文本\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("13397470679")
        textField.tap()
        
        let secureTextField = app.secureTextFields["请输入密码"]
        secureTextField.tap()
        app.buttons["登 录"].tap()
        
        wait(interval: 1.0)
        let tabBarsQuery = app.tabBars
        tabBarsQuery.children(matching: .other).element(boundBy: 4).tap()
        wait(interval: 1.0)
        tabBarsQuery.otherElements["发现 - tab - 4 of 5"].tap()
        wait(interval: 1.0)
        tabBarsQuery.otherElements["文章 - tab - 2 of 5"].tap()
        
    }
    
    func wait(interval: TimeInterval) {
        RunLoop.current.run(until: Date().addingTimeInterval(interval))
    }
    
}
