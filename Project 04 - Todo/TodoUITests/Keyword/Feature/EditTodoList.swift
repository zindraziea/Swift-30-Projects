//
//  EditTodoList.swift
//  TodoUITests
//
//  Created by Jirath Eak on 10/7/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class EditTodoList: CommonFunction {
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iGotoAddNewList() {
        todoListScreen.iClickbtnAdd()
    }
    
    func iClickCellWithText(_ targetString : String) {
        todoListScreen.iClickCellWithText(targetString)
    }
    
    func iInputTodoList(todoModel: TodoModel) {
        todoDetailScreen.iSelectTodoType(todotype: todoModel.txtTodoType)
        todoDetailScreen.iInputTodo(txtTodo: todoModel.txtTodoTitle)
        todoDetailScreen.iSelectMonth(todoMonth: todoModel.txtMonth)
        todoDetailScreen.iSelectDate(todoDate: todoModel.txtDate)
        todoDetailScreen.iSelectYear(todoYear: todoModel.txtYear)
        todoDetailScreen.iClickTodoTitle()
        todoDetailScreen.iClickDone()
    }
    
}
