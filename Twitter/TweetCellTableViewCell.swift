//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Damon Andre Green on 2/10/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileimageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    var favorited: Bool = false
    var tweetId: Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { (error) in
                print("Favorite did not suceed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID:tweetId, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetId, success: {
            self.setReweeted(isRetweeted: true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
    }
    
   
    
   
    func setFavorite( isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "heavy-black-heart_2764"), for: UIControl.State.normal)
        }
        else{ favButton.setImage(UIImage(named: "Icon-57"), for: UIControl.State.normal)
            
        }
    }
        
        func setReweeted( isRetweeted: Bool) {
            if (isRetweeted) {
                retweetButton.setImage(UIImage(named: "unnamed"), for: UIControl.State.normal)
                retweetButton.isEnabled = false
            } else {
                retweetButton.setImage(UIImage(named: "Icon-72"), for: UIControl.State.normal)
                               retweetButton.isEnabled = true
            }
        }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
