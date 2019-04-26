//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by Jirath Eak on 25/4/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class TodoUITests: XCTestCase {
    
    private lazy var app = XCUIApplication()
    //Todo List
    private lazy var btnAdd:XCUIElement = app.buttons["+"]
    private lazy var btnEdit:XCUIElement = app.buttons["Edit"]
    private lazy var listTodo:XCUIElementQuery = app.tables.cells
    //Add New Item
    private lazy var btnChild:XCUIElement = app.buttons["child"]
    private lazy var btnPhone:XCUIElement = app.buttons["phone"]
    private lazy var btnShopingCart:XCUIElement = app.buttons["shopping cart"]
    private lazy var btnTravel:XCUIElement = app.buttons["travel"]
    private lazy var txtTodoTitle:XCUIElement = app.staticTexts["Todo Title:"]
    private lazy var txtTodo:XCUIElement = app.textFields["txtTodo"]
    private lazy var datePicker:XCUIElementQuery = app.datePickers
    private lazy var btnDone:XCUIElement = app.buttons["Done"]

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        print(app.debugDescription)
    }
    
    func test101() {
        btnAdd.tap()
        btnTravel.tap()
        txtTodo.tap()
        txtTodo.typeText("test 101")
        datePicker.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "June")
        datePicker.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "1")
        datePicker.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "2020")
        txtTodoTitle.tap()
        btnDone.tap()
        XCTAssert(app.cells.element(boundBy: 4).images["travel-selected"].exists)
        XCTAssertEqual(app.cells.element(boundBy: 4).staticTexts["titleLabel"].label, "test 101")
        XCTAssertEqual(app.cells.element(boundBy: 4).staticTexts["dateLabel"].label, "2020-06-01")
    }
    
}
