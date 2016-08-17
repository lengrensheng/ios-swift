//
//  TodoModel.swift
//  UIView_day_four
//
//  Created by stokey on 16/8/4.
//  Copyright © 2016年 stokey. All rights reserved.
//

import Foundation

class TodoModel:NSObject{
    var id:String
    var image:String
    var title:String
    var date:NSDate
    
    init(id:String,image:String,title:String,date:NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
    func toString() -> String {
        return ("\(self.id),\(self.title),\(self.image),\(self.date)")
    }
}