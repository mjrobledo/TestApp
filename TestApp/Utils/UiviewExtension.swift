//
//
// UiviewExtension.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 20/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import UIKit

extension UIView {
    /// Redondea unas vista por la mitad de lo alto
    func round() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    /// Redondea las esquinas en un radio solcitado
    /// - Parameter radius: Int Tamaño del redondeo que se debe aplicar a la vista
    func round(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.masksToBounds = true
    }
}
