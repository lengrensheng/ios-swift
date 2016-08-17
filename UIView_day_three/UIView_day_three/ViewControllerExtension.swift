//
//  ViewControllerExtension.swift
//  UIView_day_three
//
//  Created by stokey on 16/8/2.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

extension ViewController:UIPickerViewDataSource{
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageResources.count;
    }
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageResources[row];
    }
}