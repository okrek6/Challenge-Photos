//
//  PhotosViewController.swift
//  Photos
//
//  Created by Brendan Krekeler on 10/16/18.
//  Copyright © 2018 Brendan Krekeler. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var pickedImageView: UIImageView!
    
    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController.delegate = self
    }
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        takePhoto()
    }
    
    @IBAction func accessPhotos(_ sender: Any) {
        selectPhotoFromLibrary()
    }
    
    func takePhoto(){
        if(!UIImagePickerController.isSourceTypeAvailable(.camera)){
        presentAlert(title: "Camera Not Found", message: "This device is missing a camera")
        } else {
            imagePickerController.allowsEditing = false
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        }
        
    }
    
    func selectPhotoFromLibrary(){
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        pickedImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


}
