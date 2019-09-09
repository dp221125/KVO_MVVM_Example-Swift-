//
//  MainTest.swift
//  KVO_ExampleTests
//
//  Created by Milkyo on 09/09/2019.
//  Copyright © 2019 MilKyo. All rights reserved.
//

@testable import KVO_Example
import XCTest

class MainTest: XCTestCase {
    var mainViewModel: MainViewModel!

    override func setUp() {
        self.mainViewModel = MainViewModel()
    }

    func testIDVaild() {
        self.mainViewModel.idCheck(nil)
        XCTAssertEqual(self.mainViewModel.idVaild, false)
        self.mainViewModel.idCheck("A")
        XCTAssertEqual(self.mainViewModel.idVaild, true)
        self.mainViewModel.idCheck("AAAAAAAAAAA")
        XCTAssertEqual(self.mainViewModel.idVaild, false)
    }

    func testPassWordVaild() {
        self.mainViewModel.passwordCheck(nil)
        XCTAssertEqual(self.mainViewModel.passwordVaild, false)
        self.mainViewModel.passwordCheck("8")
        XCTAssertEqual(self.mainViewModel.passwordVaild, false)
        self.mainViewModel.passwordCheck("88888!")
        XCTAssertEqual(self.mainViewModel.passwordVaild, true)
    }

    func testTotalVaild() {
        self.mainViewModel.idCheck(nil)
        XCTAssertEqual(self.mainViewModel.vaildButton, false)
        self.mainViewModel.idCheck("A")
        XCTAssertEqual(self.mainViewModel.vaildButton, false)
        self.mainViewModel.passwordCheck("888888!")
        XCTAssertEqual(self.mainViewModel.vaildButton, true)
        self.mainViewModel.passwordCheck("")
        XCTAssertEqual(self.mainViewModel.vaildButton, false)
    }
}
