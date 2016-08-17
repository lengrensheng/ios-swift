//
//  VideoCell.swift
//  day_three
//
//  Created by meizu on 16/8/16.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

struct Video {
    let image:String
    let title:String
    let source:String
}

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var screenImage: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var srcLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    var onPlayButtonTapped:(()->Void)?
    
    @IBAction func playTapped(sender: AnyObject) {
        if let onPlayButtonTapped = self.onPlayButtonTapped{
            onPlayButtonTapped()
        }
    }
}
