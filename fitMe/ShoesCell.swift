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
    
    func setShoes(brand:String, price:Double?, size:String?, shoesImageName:String?, available:Bool, bought:Bool) {
        self.brandLabel.text = brand
        self.priceLabel.text = NSString(format: "%.2f £", price!) as String!
        self.sizeLabel.text = size
        self.shoesImageView.image = UIImage(named: shoesImageName!)
        self.buyBtn.layer.cornerRadius = 4
        
        //if user already bought text will change 
        let titleOfButton = bought ? "Bought" : "Buy Now"
        self.buyBtn.backgroundColor = available ? UIColor(red: 72/255, green: 180/255, blue: 193/255, alpha: 1.0) : UIColor.grayColor()
        self.contentView.backgroundColor = available ? UIColor.clearColor() : UIColor.lightGrayColor()
        self.buyBtn.setTitle(titleOfButton, forState: UIControlState.Normal)
    }
    
}