//
//  BangumiListModelTest.swift
//  NhkBangumiTests
//
//  Created by 大沼　陽平 on 2019/05/21.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
@testable import NhkBangumi

class BangumiListModelTest: XCTestCase {
    
    var bangumiList:BangumiListModel!
    
    override func setUp() {
        bangumiList = BangumiListModel()
    }
    
    override func tearDown() {
    }
    
    func testExample() {

        let json = try! bangumiList.getBangumiList().toBlocking()
        .first()!

        print(json)
        XCTAssertNotNil(json)
    }
    
}
