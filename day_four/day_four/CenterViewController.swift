//
//  CenterViewController.swift
//  day_four
//
//  Created by meizu on 16/8/17.
//  Copyright © 2016年 stokey. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class CenterViewController:UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var openCameraButton: UIButton!
    @IBOutlet weak var openCameraRollButton: UIButton!
    
    var newMedia:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        //选中图片后回调
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        self.dismissViewControllerAnimated(true, completion: nil)
        
        if mediaType == kUTTypeImage as String{
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            imageView.image = image
            if(newMedia == true){
                UIImageWriteToSavedPhotosAlbum(image, self, Selector("image:didFinishSavingWithError:contextInfo"), nil)
            }else if mediaType == (kUTTypeVideo as String){
                print("can't save video")
            }
        }
    
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadCamera(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = true
        }else{
            print("camera can't use")
        }
    }
    
    func loadCameraRoll(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = false
        }else{
            print("camera roll can't use")
        }
    }
    @IBAction func openCamera(sender: AnyObject) {
        loadCamera()
    }
    @IBAction func openCameraRoll(sender: AnyObject) {
        loadCameraRoll()
    }
}