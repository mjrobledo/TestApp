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
    func loadInfoView()
  
}

protocol DetailPresenterProtocol {
    var item : AppModel { get }
}


class DetailPresenter: DetailPresenterProtocol {
    //var delegate: DetailViewProtocol?
    var item: AppModel
    private var delegate: DetailViewProtocol?
    
    init(data: AppModel, delegate: DetailViewProtocol) {
        self.item = data
        self.delegate = delegate
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.delegate?.loadInfoView()
        })        
    }
}
