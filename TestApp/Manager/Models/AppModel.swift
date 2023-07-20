//
//
// AppModel.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 20/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import Foundation
 
struct AppsList : Codable {
    let apps: [AppModel]
}

struct AppModel : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let rating : Int?
    let price : Double?
    let developer : String?
    let category : Int?
    let comments : [Comments]?

    
    var priceDescription: String {
        guard let price = price else {
            return ""
        }
        
        if price < Double(0.5) {
            return "FREE"
        }
        return "$\(price.description)"
    }
    
    var imageHeader: String {
        if let id = id {
            return "\(id)_header"
        }
        return ""
    }
}
