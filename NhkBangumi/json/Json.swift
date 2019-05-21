//
//  Json.swift
//  NhkBangumi
//
//  Created by 大沼　陽平 on 2019/05/20.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//

struct JsonResonceFormat: Codable {
    let list: ProgramList
}

struct ProgramList: Codable {
    let g1: [Program]
}

struct Program: Codable {

    let id: String
    let event_id: String
    let start_time: String
    let end_time: String
    let area: Area
    let service: Service
    let title: String
    let subtitle: String
    let genres: [String]

}

struct Area: Codable {
    let id: String
    let name: String
}

struct Service: Codable {
    let id: String
    let name: String
    let logo_s: Logo
    let logo_m: Logo
    let logo_l: Logo
}

struct Logo: Codable {
    let url: String
    let width: String
    let height: String
}
