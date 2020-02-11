//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by Jirath Eak on 25/4/2562 BE.
//  Copyright © 2562 YiGu. All rights reserved.
//

import XCTest

class CommonFunction: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func iSaveScreenshot(to activity: XCTActivity) {
        let screenshot = XCTAttachment(screenshot: XCUIApplication().screenshot())
        screenshot.lifetime = .keepAlways
        activity.add(screenshot)
    }
    
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        
        // We use a buffer here to avoid flakiness with Timer on CI
        wait(for: [waitExpectation], timeout: duration+0.5)
    }
    
    func waitForElement(_ element: XCUIElement, timeout: TimeInterval = 12, exist: Bool) -> Bool {
        let predicate = NSPredicate(format: "exists == " + String(exist))
        let expectations = expectation(for: predicate, evaluatedWith: element, handler: nil)
        let result = XCTWaiter().wait(for: [expectations], timeout: timeout)
        return result == .completed
    }
    
    func waitForElementToAppear(_ element: XCUIElement, timeout: TimeInterval = 12) -> Bool {
        return waitForElement(element, timeout: timeout, exist: true)
    }
    
    func waitForElementHitable(_ element: XCUIElement, timeout: TimeInterval = 12, exist: Bool=true) -> Bool {
        let predicate = NSPredicate(format: "isHittable == true")
        let expectations = expectation(for: predicate, evaluatedWith: element, handler: nil)
        let result = XCTWaiter().wait(for: [expectations], timeout: timeout)
        return result == .completed
    }
    
    func unwrapped<T>(_ wrapped: T?, with castValue: T) -> T {
        if let unwrapped = wrapped {
            return unwrapped
        } else {
            return castValue
        }
    }
    
    func getLocalizeStr(strKey: String, tablename: String, targetLanguage: String) -> String {
        let testLanguage = targetLanguage
        if let path = Bundle(for: type(of: self)).path(forResource: testLanguage, ofType: "lproj"), let bundle = Bundle(path: path) {
            let localString = NSLocalizedString(strKey, tableName: tablename, bundle: bundle, comment: "Null")
            return localString
        }
        return ""
    }

}

extension XCUIElement {

    func clearAndEnterText(text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        self.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
        self.typeText(text)
    }
}

