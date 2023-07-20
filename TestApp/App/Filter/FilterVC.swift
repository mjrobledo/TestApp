//
//
// FilterVC.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import UIKit

protocol FilterProtocol {
    func selectedCategoryId(_ id: Int)
}

class FilterVC: UIViewController {
    var delegate: FilterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension FilterVC {
    class func openFilterVC() -> UIViewController {
        let bundle = Bundle(for: HomeView.self)
        let view : FilterVC = FilterVC(nibName: "FilterVC", bundle: bundle)
        
        let navigation = UINavigationController(rootViewController: view)
        return navigation
        
    }
}
