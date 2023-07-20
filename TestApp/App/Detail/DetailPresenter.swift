//
//
// DetailPresenter.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import Foundation


protocol DetailViewProtocol : AnyObject {
    func showError(_ message: String)
  
}

protocol DetailPresenterProtocol {

}


class DetailPresenter: DetailPresenterProtocol {
    var delegate: DetailViewProtocol?
    
    init(delegate: DetailViewProtocol) {
        self.delegate = delegate
    }
}
