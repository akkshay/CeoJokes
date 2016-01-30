//
//  FeedViewController.swift
//  FeedDemo
//
//  Created by Akkshay Khoslaa on 10/23/15.
//  Copyright © 2015 Akkshay Khoslaa. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, FeedCollectionViewCellDelegate {
    
    
    var posts = ["How many programmers does it take to change a light bulb? None. It's a hardware problem.", "Why was the JavaScript developer sad? Because he didn't Node how to Express himself", "Why did the developer go broke? Because he used up all his cache", "8 bytes walk into a bar, the bartenders asks What will it be? One of them says, Make us a double.", "Two bytes meet. The first byte asks, Are you ill? The second byte replies, No, just feeling a bit off."]
    var usernames = ["Steve Jobs", "Tim Cook", "Bill Gates", "Mark Zuckerburg", "Elon Musk"]
    var profilePictures = [UIImage(named: "stevejobs"), UIImage(named: "timcook"), UIImage(named: "billgates"), UIImage(named: "markzuckerburg"), UIImage(named: "elonmusk")]
    var currPerson = ""

    @IBOutlet weak var feedCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController!.navigationBar.hidden = false
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 0.2, green: 0.678, blue: 1, alpha: 1)
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? Dictionary
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewProfile(cell: FeedCollectionViewCell) {
        currPerson = cell.username.text!
        performSegueWithIdentifier("toProfile", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toProfile") {
            var profileVC = segue.destinationViewController as! ProfileViewController
            profileVC.username = currPerson
            
        }
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let content = posts[indexPath.row]
        let numCharacters = content.characters.count
        var lines = CGFloat(numCharacters) / 50.0
        lines = ceil(lines)
        lines = lines - 2.0
        
        print(170 + 17*lines)
        
        var height = 170 + 17*lines
        return CGSizeMake(CGFloat(300), (170 + 17*lines))
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("postsFeedToPostsDetail", sender: nil)
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = feedCollectionView.dequeueReusableCellWithReuseIdentifier("feedCell", forIndexPath: indexPath) as! FeedCollectionViewCell
        
        cell.delegate = self
        cell.contentText.text = posts[indexPath.row]
        cell.profilePicture.image = profilePictures[indexPath.row]
        cell.username.text = usernames[indexPath.row]
        cell.profilePicture.layer.cornerRadius = cell.profilePicture.frame.size.width/2
        cell.profilePicture.clipsToBounds = true
   
        
        return cell
        
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
