//
//  ViewController.swift
//  Photos
//
//  Created by Timothy Rodney Nugent on 26/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit

// ------
// making the class conform to the picker and navigation delegate
// BEGIN picker_setup
class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
// END picker_setup
                            
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// ------
// taking a photo
// BEGIN picker_photo
    @IBAction func takePhoto(sender: AnyObject) {
        var picker = UIImagePickerController()
        
        let sourceType = UIImagePickerControllerSourceType.Camera
        if (UIImagePickerController.isSourceTypeAvailable(sourceType))
        {
            // we can use the camera
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            
            let frontCamera = UIImagePickerControllerCameraDevice.Front
            let rearCamera = UIImagePickerControllerCameraDevice.Rear
            //use the front-facing camera if available
            if (UIImagePickerController.isCameraDeviceAvailable(frontCamera))
            {
                picker.cameraDevice = frontCamera
            }
            else
            {
                picker.cameraDevice = rearCamera
            }
            // make this object be the delegate for the picker
            picker.delegate = self
            
            self.presentViewController(picker, animated: true,
                completion: nil)
        }
        
    }
// END picker_photo
    
// ------
// make the picker view show the photo library
// BEGIN picker_library
    @IBAction func loadFromLibrary(sender: AnyObject) {
        var picker = UIImagePickerController()
        picker.sourceType =
            UIImagePickerControllerSourceType.SavedPhotosAlbum
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
// END picker_library
    
// ------
// picker delegate methods
// BEGIN picker_delegates
    func imagePickerController(picker: UIImagePickerController!,
                didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!)
    {
        let image: UIImage =
                    info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
// END picker_delegates
    
    func neverCalled()
    {
// ------
// picker delegate methods
// BEGIN picker_1
        let sourceType = UIImagePickerControllerSourceType.Camera
        if (UIImagePickerController.isSourceTypeAvailable(sourceType))
        {
            // we can use the camera
        }
        else
        {
            // we can't use the camera
        }
// END picker_1
// ------
// picker delegate methods
// BEGIN picker_2
        let frontCamera = UIImagePickerControllerCameraDevice.Front
        let rearCamera = UIImagePickerControllerCameraDevice.Rear
        if (UIImagePickerController.isCameraDeviceAvailable(frontCamera))
        {
            // the front camera is available
        }
        if (UIImagePickerController.isCameraDeviceAvailable(rearCamera))
        {
            // the rear camera is available
        }
// END picker_2
    }
}

