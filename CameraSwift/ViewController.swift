//
//  ViewController.swift
//  CameraSwift
//
//  Created by 彬海 朱 on 14/12/20.
//  Copyright (c) 2014年 XTF. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var imagea: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var actionPhotoLibrary = UIButton(frame:CGRect(x: 10, y: 30, width: 100, height: 35))
        actionPhotoLibrary.setTitle("调用相册", forState: UIControlState.Normal)
        actionPhotoLibrary.addTarget(self, action: "actionPhotoLibrary", forControlEvents: UIControlEvents.TouchUpInside)
        actionPhotoLibrary.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(actionPhotoLibrary)
        
        
        var actionCamera = UIButton(frame:CGRect(x: 115, y: 30, width: 100, height: 35))
        actionCamera.setTitle("调用相机", forState: UIControlState.Normal)
        actionCamera.addTarget(self, action: "actionCamera", forControlEvents: UIControlEvents.TouchUpInside)
        actionCamera.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(actionCamera)
        
        var SavedPhotosAlbum = UIButton(frame:CGRect(x: 220, y: 30, width: 100, height: 35))
        SavedPhotosAlbum.setTitle("调用截图", forState: UIControlState.Normal)
        SavedPhotosAlbum.addTarget(self, action: "actionSavedPhotosAlbum", forControlEvents: UIControlEvents.TouchUpInside)
        SavedPhotosAlbum.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(SavedPhotosAlbum)
        
        
    
    }
    
    func actionPhotoLibrary(){
    
        var imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    
    }
    
    func actionCamera(){
        
        var imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func actionSavedPhotosAlbum(){
        
        var imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

extension ViewController: UINavigationControllerDelegate{

}

extension ViewController: UIImagePickerControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
        
      self.dismissViewControllerAnimated(true, completion: nil)
        print(info)
        self.imagea.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }

}
