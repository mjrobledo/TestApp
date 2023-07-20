//
//
// HomeView.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import UIKit

class HomeView: UIViewController {

    lazy var presenter: HomePresenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialView()
        // Do any additional setup after loading the view.
    }
    
    private func initialView() {
        self.title = "Amazon Store"
        self.addFilterButton()
    }
    
    /// Configura la vista, agrega un botón para descargar el PDF
    private func addFilterButton() {
        let item = UIBarButtonItem(image:UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(filterView))
        item.tintColor = .systemBlue
        self.navigationItem.rightBarButtonItems = [item]
    }
    
    @objc func filterView() {
        self.present(FilterVC.openFilterVC(), animated: true)
    }
}

extension HomeView: HomeViewProtocol {
    func showError(_ message: String) {
    
    }
}
