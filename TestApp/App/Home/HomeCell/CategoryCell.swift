//
//
// CategoryCell.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var viewForm: UIView!
    @IBOutlet weak var imgApp: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewRating: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewForm.round(radius: 5)
    }

    func loadCell(app: AppModel) {
        viewRating.fillNumRating(app.rating ?? 0)
        lblName.text = app.name
        lblPrice.text = app.priceDescription
        lblDescription.text = app.description
        imgApp.image = UIImage(named: app.id?.description ?? "0")
    }
}


extension UIView {
    func fillNumRating(_ num: Int, applyColor: Bool? = false) {
        self.defaultRating()
        let isColor: Bool = applyColor ?? false
        let colorRed: UIColor = isColor ? .red : UIColor(named: "PrincipalColor")!
        let colorGreen: UIColor = isColor ? .green : UIColor(named: "PrincipalColor")!
        switch num {
        case 1:
            self.enableColor(range: 1...1, color: colorRed)
        case 2:
            self.enableColor(range: 1...2, color: colorRed)
        case 3:
            self.enableColor(range: 1...3, color: colorGreen)
        case 4:
            self.enableColor(range: 1...4, color: colorGreen)
        case 5:
            self.enableColor(range: 1...5, color: colorGreen)
        default:
            return
        }
    }
    
    func defaultRating() {
        for item in 1...5 {
            if let image1 = self.viewWithTag(item) as? UIImageView  {
                image1.image = UIImage(systemName: "star")
                image1.tintColor = UIColor(named: "DisableColor")
            }
        }
    }
    
    func enableColor(range: ClosedRange<Int>, color: UIColor) {
        for item in range {
            if let image1 = self.viewWithTag(item) as? UIImageView  {
                image1.image = UIImage(systemName: "star.fill")
                image1.tintColor = color
            }
        }
    }
}
