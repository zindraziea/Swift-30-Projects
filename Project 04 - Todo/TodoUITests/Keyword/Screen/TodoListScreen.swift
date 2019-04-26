//
//  TodoListScreen.swift
//  TodoUITests
//
//  Created by Jirath Eak on 26/4/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class TodoListScreen: CommonFunction {
    private lazy var app = XCUIApplication()
    private lazy var btnAdd:XCUIElement = app.buttons["+"]
    private lazy var btnEdit:XCUIElement = app.buttons["Edit"]
    private lazy var celllistTodo:XCUIElementQuery = app.tables.cells
    
    func iClickbtnEdit() {
        btnEdit.tap()
    }
    
    func iClickbtnAdd() {
        btnAdd.tap()
    }
    
    func iClickCellWithIndex(index: Int) {
        celllistTodo.element(boundBy: index).tap()
    }
    
    func iClickLastCell() {
        let lastCell = app.tables.cells.count-1
        celllistTodo.element(boundBy: lastCell).tap()
    }
    
    func iVerifyLastTodoList(todotype: TodoType, txtTitle: String, txtDateFormat: String) {
        let lastCell = app.tables.cells.count-1
        
        XCTAssert(celllistTodo.element(boundBy: lastCell).images[todotype.rawValue].exists)
        XCTAssertEqual(celllistTodo.element(boundBy: lastCell).staticTexts["titleLabel"].label, txtTitle)
        XCTAssertEqual(celllistTodo.element(boundBy: lastCell).staticTexts["dateLabel"].label, txtDateFormat)
    }
    
}
