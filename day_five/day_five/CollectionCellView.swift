//
//  CollectionCellView.swift
//  day_five
//
//  Created by meizu on 16/8/17.
//  Copyright © 2016年 stokey. All rights reserved.
//

import Foundation
import UIKit

struct ImageCell {
    var image:String
    var content:String
}
class CollectionCellView:UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var desTitle: UILabel!
    
    var onClick:(()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}