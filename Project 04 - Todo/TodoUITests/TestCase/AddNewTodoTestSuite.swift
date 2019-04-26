//
//  AddNewTodoTestSuite.swift
//  TodoUITests
//
//  Created by Jirath Eak on 26/4/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class AddNewTodoTestSuite: CommonFunction {
    
    private lazy var addNewTodoList = AddNewTodoList()
    private lazy var verifyTodoList = VerifyTodoList()
    
    func test_Project_101() {
        let txtType:TodoType = TodoType.child
        let txtTitle:String = "test 101"
        let txtMonth:Month = Month.December
        let txtDate:String = "10"
        let txtYear:String = "2019"
        let txtDateFormat:String = "2019-12-10"
        
        let txtTodoModel = TodoModel(txtTodoType: txtType, txtTodoTitle: txtTitle, txtMonth: txtMonth, txtDate: txtDate, txtYear: txtYear, txtDateFormat: txtDateFormat)
        
        addNewTodoList.iGotoAddNewList()
        addNewTodoList.iInputNewList(todoModel: txtTodoModel)
        verifyTodoList.iVerifyLastTodoList(todoModel: txtTodoModel)
    }
}
