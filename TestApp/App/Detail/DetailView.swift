//
//
// DetailView.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import UIKit

class DetailView: UIViewController {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgHeader: UIImageView!
    @IBOutlet weak var viewRating: UIStackView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDeveloper: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var tblComments: UITableView!
    
    var presenter: DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        self.addInstallButton()
    }
    
    private func configTableView() {
        tblComments.register(UINib(nibName: "CellComment", bundle: nil), forCellReuseIdentifier: "cell")
        tblComments.estimatedRowHeight = 88.0
        tblComments.rowHeight = UITableView.automaticDimension
        tblComments.delegate = self
        tblComments.dataSource = self
    }
    
    private func addInstallButton() {
        let item = UIBarButtonItem(image:UIImage(systemName: "square.and.arrow.down"), style: .plain, target: self, action: #selector(downloadApp))
        item.tintColor = .systemBlue
        self.navigationItem.rightBarButtonItems = [item]
    }
    
    @objc func downloadApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.infoAlert(title: "Exito", message: "La aplicación se instalo correctamente")
        })
    }
}

extension DetailView: DetailViewProtocol {
    func showError(_ message: String) {
        self.infoAlert(title: "Algo salio mal!", message: message)
    }
    
    func loadInfoView() {
        guard let presenter = presenter else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        
        imgIcon.image = UIImage(named: presenter.item.id?.description ?? "0")
        lblName.text = presenter.item.name
        lblPrice.text = presenter.item.priceDescription
        lblDeveloper.text = presenter.item.developer
        lblDescription.text = presenter.item.description
        viewRating.fillNumRating(presenter.item.rating ?? 0, applyColor: true)
        
        if !presenter.item.imageHeader.isEmpty  {
            if let image: UIImage = UIImage(named: presenter.item.imageHeader) {
                imgHeader.image = image
                imgHeader.contentMode = .scaleToFill
                return
            }
            imgHeader.contentMode = .scaleAspectFit
            imgHeader.image = UIImage(named: "ic_notAvailable")
        }
        tblComments.reloadData()
    }
}

extension DetailView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.item.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CellComment else {
            return UITableViewCell()
        }
        guard let comment = presenter?.item.comments?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.loadCellWithComment(comment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
