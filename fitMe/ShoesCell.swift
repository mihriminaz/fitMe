//
//  ShoesCell.swift
//  fitMe
//
//  Created by Mihri on 07/07/15.
//  Copyright (c) 2015 Minaz. All rights reserved.
//

import UIKit

class ShoesCell : UITableViewCell {
    
    @IBOutlet weak var shoesImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var buyBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setShoes(brand:String, price:Double?, size:String?, shoesImageName:String?, available:Bool) {
        self.brandLabel.text = brand
        self.priceLabel.text = NSString(format: "%d", price!) as String!
        self.sizeLabel.text = size
        self.shoesImageView.image = UIImage(named: shoesImageName!)
        self.buyBtn.hidden = !available
    }
    
}