//
//  ViewController.swift
//  fitMe
//
//  Created by Mihri on 07/07/15.
//  Copyright (c) 2015 Minaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var shoesList = [ShoesObject]()
    
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
        cell.setShoes(shoes.brand!, price: shoes.price, size:shoes.size, shoesImageName: shoes.image, available: shoes.available)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //buy the shoes sth
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoesList.count
    }

}

