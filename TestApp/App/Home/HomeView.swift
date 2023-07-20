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
    
    
    @IBOutlet weak var collCategories: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialView()
        // Do any additional setup after loading the view.
        self.presenter.getListApps()
    }
    
    private func initialView() {
        self.title = "Amazon Store"
        self.addFilterButton()
        self.configureCollectionView()
    }
    
    private func configureCollectionView() {
        collCategories.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collCategories.delegate = self
        collCategories.dataSource = self
    }
     
    private func addFilterButton() {
        let item = UIBarButtonItem(image:UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(filterView))
        item.tintColor = .systemBlue
        self.navigationItem.rightBarButtonItems = [item]
    }
    
    @objc func filterView() {
        self.present(FilterVC.openFilterVC(delegate: self), animated: true)
    }
}

extension HomeView: HomeViewProtocol {
    func showError(_ message: String) {
        
    }
    
    func reloadApps() {
        self.collCategories.reloadData()
    }
    
    func addTitleView(_ title: String) {
        self.title = title
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategoryCell
        
        cell?.loadCell(app: presenter.items[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //workaround to center to every cell including ones near margins
        let item = presenter.items[indexPath.row]
        self.navigationController?.pushViewController(UIViewController.createDetailView(data: item), animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let  width = (collectionView.frame.width / 3) - 7
        
        return CGSize(width: width, height: 225)
    }
}

extension HomeView: FilterProtocol {
    func selectedCategoryId(id: Int) {
        presenter.loadInfoByIdCategory(id)
    }
}
