//
//
// HomeViewPresenter.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import Foundation

class HomePresenter : HomePreseterProtocol {
    
    private weak var delegate: HomeViewProtocol?
    
    init(delegate: HomeViewProtocol) {
        self.delegate = delegate
    }
    
    func getListApps() {
        
    }
}


// MARK: - Protocolos
protocol HomeViewProtocol : AnyObject {
    func showError(_ message: String)
}

protocol HomePreseterProtocol {
    func getListApps()
}

