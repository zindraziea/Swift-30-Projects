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
    private lazy var editTodoList = EditTodoList()
    private lazy var deleteTodoList = DeleteTodoList()
    
    private lazy var txtType:TodoType = TodoType.child
    private lazy var txtTitle:String = "test 101"
    private lazy var txtMonth:Month = Month.December
    private lazy var txtDate:String = "10"
    private lazy var txtYear:String = "2019"
    private lazy var txtDateFormat:String = "2019-12-10"
    private lazy var txtTodoModel = TodoModel(txtTodoType: txtType, txtTodoTitle: txtTitle, txtMonth: txtMonth, txtDate: txtDate, txtYear: txtYear, txtDateFormat: txtDateFormat)
    
    override func tearDown() {
        print(XCUIApplication().debugDescription)
    }
    
    func test_Projectname_101() {
        XCTContext.runActivity(named: "Create new Todo-List") { _ in
            addNewTodoList.iGotoAddNewList()
            addNewTodoList.iInputNewList(todoModel: txtTodoModel)
            verifyTodoList.iVerifyLastTodoList(todoModel: txtTodoModel)
        }
    }
    
    func test_Projectname_102() {
        XCTContext.runActivity(named: "Edit description on new Todo-List") { _ in
            let txtNewType = TodoType.shoppingCart
            let txtNewTitle = "edit test 102"
            let txtNewMonth = Month.July
            let txtNewDate = "12"
            let txtNewYear = "2022"
            let txtNewDateFormat = "2022-07-12"
            let txtNewTodoModel = TodoModel(txtTodoType: txtNewType, txtTodoTitle: txtNewTitle, txtMonth: txtNewMonth, txtDate: txtNewDate, txtYear: txtNewYear, txtDateFormat: txtNewDateFormat)
            
            addNewTodoList.iGotoAddNewList()
            addNewTodoList.iInputNewList(todoModel: txtTodoModel)
            verifyTodoList.iVerifyTodoListWithText(todoModel: txtTodoModel)
            editTodoList.iClickCellWithText(txtTitle)
            editTodoList.iInputTodoList(todoModel: txtNewTodoModel)
            verifyTodoList.iVerifyTodoListWithText(todoModel: txtNewTodoModel)
        }
    }
    
    func test_Projectname_103() {
        XCTContext.runActivity(named: "Add new 10 Todo-List") { _ in
            for i in 1...10 {
                let txtNewType = TodoType.shoppingCart
                let txtNewTitle = "add new todo \(i)"
                let txtNewMonth = Month.April
                let txtNewDate = "1"
                let txtNewYear = "2022"
                let txtNewDateFormat = "2022-04-01"
                let txtNewTodoModel = TodoModel(txtTodoType: txtNewType, txtTodoTitle: txtNewTitle, txtMonth: txtNewMonth, txtDate: txtNewDate, txtYear: txtNewYear, txtDateFormat: txtNewDateFormat)
                
                addNewTodoList.iGotoAddNewList()
                addNewTodoList.iInputNewList(todoModel: txtNewTodoModel)
                verifyTodoList.iVerifyTodoListWithText(todoModel: txtNewTodoModel)
            }
        }
    }
    
    func test_Projectname_104() {
        XCTContext.runActivity(named: "Crete new shopping and phone Todo-List, Delete all Shopping-cart type") { _ in
            let txtType1 = TodoType.shoppingCart
            let txtTitle1 = "add new todo 1"
            let txtMonth1 = Month.April
            let txtDate1 = "1"
            let txtYear1 = "2022"
            let txtDateFormat1 = "2022-04-01"
            let txtodoModel1 = TodoModel(txtTodoType: txtType1, txtTodoTitle: txtTitle1, txtMonth: txtMonth1, txtDate: txtDate1, txtYear: txtYear1, txtDateFormat: txtDateFormat1)
            let txtType2 = TodoType.phone
            let txtTitle2 = "add new todo 2"
            let txtMonth2 = Month.April
            let txtDate2 = "2"
            let txtYear2 = "2022"
            let txtDateFormat2 = "2022-04-02"
            let txtodoModel2 = TodoModel(txtTodoType: txtType2, txtTodoTitle: txtTitle2, txtMonth: txtMonth2, txtDate: txtDate2, txtYear: txtYear2, txtDateFormat: txtDateFormat2)
            
            addNewTodoList.iGotoAddNewList()
            addNewTodoList.iInputNewList(todoModel: txtodoModel1)
            verifyTodoList.iVerifyTodoListWithText(todoModel: txtodoModel1)
            addNewTodoList.iGotoAddNewList()
            addNewTodoList.iInputNewList(todoModel: txtodoModel2)
            verifyTodoList.iVerifyTodoListWithText(todoModel: txtodoModel2)
            deleteTodoList.iDeleteAllTodoWithType(todoType: TodoType.shoppingCart)
        }
    }
    
}
