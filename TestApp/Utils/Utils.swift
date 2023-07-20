//
//
// Utils.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 20/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import Foundation

extension Array<Int> {
   func removeDuplicateElements() -> [Int] {
       var uniqueElements: [Int] = []
       for x in self {
          if !uniqueElements.contains(x) {
             uniqueElements.append(x)
          }
       }
       return uniqueElements
    }
}
