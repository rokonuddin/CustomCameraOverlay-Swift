//
//  ViewController.swift
//  CustomCamera
//
//  Created by Rokon Uddin on 1/29/17.
//  Copyright © 2017 Rokon Uddin. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.layer.cornerRadius = 8.0
        cameraButton.layer.borderWidth = 2.0
        cameraButton.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func cameraButtonPressed() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            imagePickerController.mediaTypes = [kUTTypeImage as String, kUTTypeMovie as String]
            imagePickerController.showsCameraControls = false
            imagePickerController.cameraOverlayView = CustomOverlayView(frame: UIScreen.main.bounds)
            imagePickerController.modalPresentationStyle = .fullScreen
            
            present(imagePickerController, animated: true, completion: {
            
                let screenSize = UIScreen.main.bounds.size
                let ratio: CGFloat = 4.0 / 3.0
                let cameraHeight: CGFloat = screenSize.width * ratio
                let scale: CGFloat = screenSize.height / cameraHeight
                
                imagePickerController.cameraViewTransform = CGAffineTransform(translationX: 0.0, y: (screenSize.height - cameraHeight) / 2.0)
                imagePickerController.cameraViewTransform =  imagePickerController.cameraViewTransform.scaledBy(x: scale, y: scale)
                
            })
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) { }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) { }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

