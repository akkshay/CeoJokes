//
//  ProfileViewController.swift
//  FeedDemo
//
//  Created by Akkshay Khoslaa on 10/23/15.
//  Copyright © 2015 Akkshay Khoslaa. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileTableView: UITableView!
    var username = ""
    var jobsProducts = ["iPhone", "iPad", "MacBook", "Macbook Pro", "iPod"]
    var muskProducts = ["Tesla Cars", "Electronic Cars", "Expensive Cars"]
    var gatesProducts = ["Bad Quality Computers", "Bad Quality OS", "Xbox", "HoloLens"]
    var zuckerburgProducts = ["Facebook", "Internet.org"]
    var cookProducts = ["iPhone", "iPad", "MacBook", "Macbook Pro", "iPod"]
    var currProducts = Array<String>()
    var productCells = Array<UITableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        if username == "Steve Jobs" {
            currProducts = jobsProducts
        } else if username == "Elon Musk" {
            currProducts = muskProducts
        } else if username == "Bill Gates" {
            currProducts = gatesProducts
        } else if username == "Tim Cook" {
            currProducts = zuckerburgProducts
        } else if username == "Mark Zuckerburg" {
            currProducts = cookProducts
        }
        profileTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currProducts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = currProducts[indexPath.row]
        productCells.append(cell)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell = productCells[indexPath.row]
        if cell.accessoryType != UITableViewCellAccessoryType.Checkmark {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
