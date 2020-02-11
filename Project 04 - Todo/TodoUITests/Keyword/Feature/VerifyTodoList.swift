//
//  VerifyTodoList.swift
//  TodoUITests
//
//  Created by Jirath Eak on 26/4/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class VerifyTodoList: CommonFunction {
    
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iVerifyLastTodoList(todoModel: TodoModel) {
        todoListScreen.iVerifyLastTodoList(todotype: todoModel.txtTodoType, txtTitle: todoModel.txtTodoTitle, txtDateFormat: todoModel.txtDateFormat)
        todoListScreen.iClickCellWithText(todoModel.txtTodoTitle)
        todoDetailScreen.iVerifyTodoDetail(todotype: todoModel.txtTodoType, txtTitle: todoModel.txtTodoTitle, todoMonth: todoModel.txtMonth.rawValue, todoDate: todoModel.txtDate, todoYear: todoModel.txtYear)
        todoDetailScreen.iClickBackToTodoList()
    }

    func iVerifyTodoListWithText(todoModel: TodoModel) {
        todoListScreen.iVerifyTodoListWithText(todotype: todoModel.txtTodoType, txtTitle: todoModel.txtTodoTitle, txtDateFormat: todoModel.txtDateFormat)
        todoListScreen.iClickCellWithText(todoModel.txtTodoTitle)
        todoDetailScreen.iVerifyTodoDetail(todotype: todoModel.txtTodoType, txtTitle: todoModel.txtTodoTitle, todoMonth: todoModel.txtMonth.rawValue, todoDate: todoModel.txtDate, todoYear: todoModel.txtYear)
        todoDetailScreen.iClickBackToTodoList()
    }
    
    func iClickFirstCellAndClickBack() {
        todoListScreen.iClickLastCell()
        todoDetailScreen.iClickBackToTodoList()
    }
    
    func iClickLastCellAndClickBack() {
        todoListScreen.iClickFirstCell()
        todoDetailScreen.iClickBackToTodoList()
    }
}
