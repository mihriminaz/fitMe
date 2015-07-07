//
//  ViewController.swift
//  fitMe
//
//  Created by Mihri on 07/07/15.
//  Copyright (c) 2015 Minaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var shoesCollectionView: UICollectionView!
    private let reuseIdentifier = "ShoesCollectionView"
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    var shoesList = [ShoesObject]()
    var shoesBoughtList = [ShoesObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
        self.tableView.reloadData()
    }

    func loadInitialData() {
        // 1
        let fileName = NSBundle.mainBundle().pathForResource("ShoesList", ofType: "json");
        var readError : NSError?
        var data: NSData = NSData(contentsOfFile: fileName!, options: NSDataReadingOptions(0), error: &readError)!
        
        // 2
        var error: NSError?
        let jsonObject: AnyObject! = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions(0), error: &error)
        
        // 3
        if let jsonObject = jsonObject as? [String: AnyObject] where error == nil,
            // 4
            let jsonData = JSONValue.fromObject(jsonObject)?["shoesArray"]?.array {
                for shoesJSON in jsonData {
                    if let aShoesObject = shoesJSON.object,
                        // 5
                        shoes = ShoesObject.fromJSON(aShoesObject) {
                            shoesList.append(shoes)
                            if shoes.isBought == true {
                               shoesBoughtList.append(shoes)
                            }
                    }
                }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ShoesCell") as! ShoesCell

        let shoes = shoesList[indexPath.row]
        cell.setShoes(shoes.brand!, price: shoes.price, size:shoes.size, shoesImageName: shoes.image, available: shoes.available, bought: shoes.isBought)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //buy the shoes sth
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoesList.count
    }

    
    //1
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shoesBoughtList.count
    }
    
    //3
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ShoesCollectionView
        //2
        let shoes = shoesBoughtList[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        //3
        cell.shoesImageView.image = UIImage(named:shoes.image!)
        
        let isFit : Bool = shoes.isFit!
        let greenFitColor = UIColor(red: 72/255, green: 180/255, blue: 193/255, alpha: 0.5)
        cell.shoesFitBGView.backgroundColor = isFit ? greenFitColor : UIColor.redColor().colorWithAlphaComponent(0.5)
        cell.shoesDesc.text = NSString(format: "%@ - %@", shoes.brand!, shoes.size!) as String
        
        return cell
    }
    
    //1
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 160, height: 160)
    }
    
    //3
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    
}

