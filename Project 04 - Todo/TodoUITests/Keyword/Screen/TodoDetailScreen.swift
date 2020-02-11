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
    private lazy var btnBack:XCUIElement = app.buttons["Todo List"]
    
    func iSelectTodoType(todotype: TodoType) {
        XCTContext.runActivity(named: "Select todo type: \(todotype.rawValue)") { _ in
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
    }
    
    func iVerifySelectTodoType(todotype: TodoType) {
        XCTContext.runActivity(named: "Verify todo type: \(todotype.rawValue)") { _ in
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
    }
    
    func iInputTodo(txtTodo: String) {
        XCTContext.runActivity(named: "Input todo text: \(txtTodo)") { _ in
        txtTodoInput.clearAndEnterText(text: txtTodo)
        }
    }
    
    func iClickTodoTitle() {
        XCTContext.runActivity(named: "Click on todo title") { _ in
        txtTodoTitle.tap()
        }
    }
    
    func iSelectMonth(todoMonth: Month) {
        XCTContext.runActivity(named: "Select month: \(todoMonth.rawValue)") { _ in
        pickerMonth.adjust(toPickerWheelValue: todoMonth.rawValue)
        }
    }
    
    func iSelectDate(todoDate: String) {
        XCTContext.runActivity(named: "Select date: \(todoDate)") { _ in
        pickerDate.adjust(toPickerWheelValue: todoDate)
        }
    }
    
    func iSelectYear(todoYear: String) {
        XCTContext.runActivity(named: "Select year: \(todoYear)") { _ in
        pickerYear.adjust(toPickerWheelValue: todoYear)
        }
    }
    
    func iClickDone() {
        XCTContext.runActivity(named: "Click on done button") { _ in
        btnDone.tap()
        }
    }
    
    func iVerifyTodoDetail(todotype: TodoType, txtTitle: String, todoMonth: String, todoDate: String, todoYear: String) {
        XCTContext.runActivity(named: "Verify data on todo detail screen") { _ in
        iVerifySelectTodoType(todotype: todotype)
        XCTAssertEqual(unwrapped(txtTodoInput.value as? String, with:""), txtTitle)
        XCTAssertEqual(unwrapped(pickerMonth.value as? String, with:""), todoMonth)
        XCTAssertEqual(unwrapped(pickerDate.value as? String, with:""), todoDate)
        XCTAssertEqual(unwrapped(pickerYear.value as? String, with:""), todoYear)
        }
    }
    
    func iClickBackToTodoList() {
        XCTContext.runActivity(named: "Click back button") { _ in
        btnBack.tap()
        }
    }
    
}
