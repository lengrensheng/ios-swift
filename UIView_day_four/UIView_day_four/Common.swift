//
//  Common.swift
//  UIView_day_four
//
//  Created by stokey on 16/8/4.
//  Copyright © 2016年 stokey. All rights reserved.
//

import Foundation

func dateFromString(date:String) -> NSDate? {
    let dateFormatter = NSDateFormatter();
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let nsDate = dateFormatter.dateFromString(date)
    return nsDate
}