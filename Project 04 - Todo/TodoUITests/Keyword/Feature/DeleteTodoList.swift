//
//  DeleteTodoList.swift
//  TodoUITests
//
//  Created by Jirath Eak on 10/7/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class DeleteTodoList: CommonFunction {
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iDeleteAllTodoWithType(todoType: TodoType) {
        todoListScreen.iClickbtnEdit()
        todoListScreen.iDeleteAllTodoWithType(todoType: todoType)
    }
    
}
