//
//
// ViewControllerExtension.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import Foundation
import UIKit

extension UIViewController {
    class func openHomeView() -> UIViewController {
        let bundle = Bundle(for: HomeView.self)
        let view : HomeView = HomeView(nibName: "HomeView", bundle: bundle)
        
        let navigation = UINavigationController(rootViewController: view)
        return navigation
        
    }
    
    class func createDetailView(data: AppModel) -> UIViewController {
        let bundle = Bundle(for: DetailView.self)
        
        let view = DetailView(nibName: "DetailView", bundle: bundle)
        view.presenter = DetailPresenter(data: data, delegate: view)
        return view
    }
    
    enum BackView {
        case centauroAdminView
        case corporatePlanView
    }
    
    func infoAlert(title: String, message: String, titleButton: String? = "Continuar") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: titleButton, style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
