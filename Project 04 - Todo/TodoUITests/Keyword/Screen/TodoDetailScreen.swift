//
//  TodoDetailScreen.swift
//  TodoUITests
//
//  Created by Jirath Eak on 26/4/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class TodoDetailScreen: CommonFunction {
    private lazy var app = XCUIApplication()
    private lazy var btnChild:XCUIElement = app.buttons["child"]
    private lazy var btnPhone:XCUIElement = app.buttons["phone"]
    private lazy var btnShopingCart:XCUIElement = app.buttons["shopping cart"]
    private lazy var btnTravel:XCUIElement = app.buttons["travel"]
    private lazy var txtTodoTitle:XCUIElement = app.staticTexts["Todo Title:"]
    private lazy var txtTodoInput:XCUIElement = app.textFields["txtTodo"]
    private lazy var pickerMonth:XCUIElement = app.datePickers.pickerWheels.element(boundBy: 0)
    private lazy var pickerDate:XCUIElement = app.datePickers.pickerWheels.element(boundBy: 1)
    private lazy var pickerYear:XCUIElement = app.datePickers.pickerWheels.element(boundBy: 2)
    private lazy var btnDone:XCUIElement = app.buttons["Done"]
    
    func iSelectTodoType(todotype: TodoType) {
        switch todotype {
        case TodoType.child:
            btnChild.tap()
        case TodoType.phone:
            btnPhone.tap()
        case TodoType.shoppingCart:
            btnShopingCart.tap()
        case TodoType.travel:
            btnTravel.tap()
        }
    }
    
    func iVerifySelectTodoType(todotype: TodoType) {
        switch todotype {
        case TodoType.child:
            XCTAssert(btnChild.isSelected)
        case TodoType.phone:
            XCTAssert(btnPhone.isSelected)
        case TodoType.shoppingCart:
            XCTAssert(btnShopingCart.isSelected)
        case TodoType.travel:
            XCTAssert(btnTravel.isSelected)
        }
    }
    
    func iInputTodo(txtTodo: String) {
        txtTodoInput.clearAndEnterText(text: txtTodo)
    }
    
    func iClickTodoTitle() {
        txtTodoTitle.tap()
    }
    
    func iSelectMonth(todoMonth: Month) {
        pickerMonth.adjust(toPickerWheelValue: todoMonth.rawValue)
    }
    
    func iSelectDate(todoDate: String) {
        pickerDate.adjust(toPickerWheelValue: todoDate)
    }
    
    func iSelectYear(todoYear: String) {
        pickerYear.adjust(toPickerWheelValue: todoYear)
    }
    
    func iClickDone() {
        btnDone.tap()
    }
    
    func iVerifyLastTodoList(todotype: TodoType, txtTitle: String, todoMonth: String, todoDate: String, todoYear: String) {
        iVerifySelectTodoType(todotype: todotype)
        XCTAssertEqual(unwrapped(txtTodoInput.value as? String, with:""), txtTitle)
        XCTAssertEqual(unwrapped(pickerMonth.value as? String, with:""), todoMonth)
        XCTAssertEqual(unwrapped(pickerDate.value as? String, with:""), todoDate)
        XCTAssertEqual(unwrapped(pickerYear.value as? String, with:""), todoYear)
    }
    
}
