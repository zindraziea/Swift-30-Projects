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
    private lazy var btnDone:XCUIElement = app.buttons["Done"]
    private lazy var cellListTodo:XCUIElementQuery = app.tables.cells
    
    func iClickbtnEdit() {
        btnEdit.tap()
    }
    
    func iClickbtnAdd() {
        btnAdd.tap()
    }
    
    func iClickCellWithIndex(index: Int) {
        XCTContext.runActivity(named: "Click cell with index: \(index)") { _ in
            cellListTodo.element(boundBy: index).tap()
        }
    }
    
    func iClickLastCell() {
        XCTContext.runActivity(named: "Click last cell") { _ in
            let lastCell = app.tables.cells.count-1
            cellListTodo.element(boundBy: lastCell).tap()
        }
    }
    
    func iClickFirstCell() {
        XCTContext.runActivity(named: "Click first cell") { _ in
            cellListTodo.element(boundBy: 0).tap()
        }
    }
    
    func iClickCellWithText(_ targetString: String) {
        XCTContext.runActivity(named: "Click cell with text: \(targetString)") { _ in
            cellListTodo.containing(.staticText, identifier: targetString).firstMatch.tap()
        }
    }
    
    func iVerifyLastTodoList(todotype: TodoType, txtTitle: String, txtDateFormat: String) {
        XCTContext.runActivity(named: "Verify todo list data last cell") { _ in
            let intLastCell = app.tables.cells.count-1
            let lastCell = app.tables.cells.element(boundBy: intLastCell)
            iVerifyTodoList(todotype: todotype, txtTitle: txtTitle, txtDateFormat: txtDateFormat, targetCell: lastCell)
        }
    }
    
    func iVerifyTodoListWithText(todotype: TodoType, txtTitle: String, txtDateFormat: String) {
        XCTContext.runActivity(named: "Verify todo list data with text: \(txtTitle) ") { _ in
            let targetCell = app.tables.cells.containing(NSPredicate(format: "label CONTAINS '\(txtTitle)'")).firstMatch
            iVerifyTodoList(todotype: todotype, txtTitle: txtTitle, txtDateFormat: txtDateFormat, targetCell: targetCell)
        }
    }
    
    private func iVerifyTodoList(todotype: TodoType, txtTitle: String, txtDateFormat: String, targetCell: XCUIElement) {
        XCTAssert(targetCell.images[todotype.rawValue].exists)
        let titleLabel = targetCell.staticTexts.matching(NSPredicate(format: "identifier BEGINSWITH 'titleLabel'")).firstMatch
        let dateLabel = targetCell.staticTexts.matching(NSPredicate(format: "identifier BEGINSWITH 'dateLabel'")).firstMatch
        XCTAssertEqual(titleLabel.label, txtTitle)
        XCTAssertEqual(dateLabel.label, txtDateFormat)
    }
    
    func iDeleteAllTodoWithType(todoType: TodoType) {
        XCTContext.runActivity(named: "Delete all todo list with type: \(todoType)") { _ in
            let targetCells = cellListTodo.containing(.image, identifier: todoType.rawValue)
            if targetCells.count > 0 {
                for _ in 0...targetCells.count-1 {
                    targetCells.firstMatch.buttons.element(boundBy: 0).tap()
                    targetCells.firstMatch.buttons["Delete"].tap()
                }
            }
        }
    }
    
}
