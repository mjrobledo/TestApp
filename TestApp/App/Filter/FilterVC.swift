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
    func selectedCategoryId(id: Int)
}

class FilterVC: UIViewController {
    
    @IBOutlet weak var tblFilter: UITableView!
    var delegate: FilterProtocol?
    private var categoryList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadCategories()
    }
    
    private func configTableView() {
        tblFilter.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblFilter.delegate = self
        tblFilter.dataSource = self
    }
    
    private func loadCategories() {
        ApiManager().getListApps { items in
            let categories: [Int] = items.map { $0.category ?? 0 }
            if !categories.isEmpty {
                self.categoryList = categories.removeDuplicateElements().sorted()
                self.categoryList.append(-1)
                self.tblFilter.reloadData()
            }
            
        }
    }
}

extension FilterVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        var content = cell?.defaultContentConfiguration()
        let id = categoryList[indexPath.row]
        if id != -1 {
            content?.text = "Categoría \(id)"
        } else {
            content?.text = "Mostrar todas"
        }


        cell?.contentConfiguration = content
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedCategoryId(id: categoryList[indexPath.row])
        self.dismiss(animated: true)
    }
    
}
    
extension FilterVC {
    class func openFilterVC(delegate: FilterProtocol) -> UIViewController {
        let bundle = Bundle(for: HomeView.self)
        let view : FilterVC = FilterVC(nibName: "FilterVC", bundle: bundle)
        view.delegate = delegate
        let navigation = UINavigationController(rootViewController: view)
        return navigation
        
    }
}
