//
//  Util.swift
//  NhkBangumi
//
//  Created by 大沼　陽平 on 2019/05/21.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//

import Foundation


extension Calendar {

    /// 共通で使用するformatter
    static let format: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format
    }()

    static func getToday() -> String {
        return format.string(from: Date())
    }
}
