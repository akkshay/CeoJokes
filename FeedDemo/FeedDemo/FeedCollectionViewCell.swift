//
//  FeedCollectionViewCell.swift
//  FeedDemo
//
//  Created by Akkshay Khoslaa on 10/23/15.
//  Copyright © 2015 Akkshay Khoslaa. All rights reserved.
//

import UIKit
protocol FeedCollectionViewCellDelegate {
    func viewProfile(cell: FeedCollectionViewCell)
}
class FeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var viewProfileButton: UIButton!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var contentText: UILabel!
    
    var delegate:FeedCollectionViewCellDelegate? = nil
    
    
    @IBAction func viewProfile(sender: AnyObject) {
        delegate!.viewProfile(self)
    }
    
}
