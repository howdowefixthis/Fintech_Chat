//
//  ProfileViewController.swift
//  Chat
//
//  Created by r.burdin on 20.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//
import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desrciptionLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var firstLetterLabel: UILabel!
    @IBOutlet weak var secondLetterLabel: UILabel!
    
    var isLabelsExist = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .init(red: 228/255, green: 232/255, blue: 43/255, alpha: 1.0)
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        
        nameLabel.text = "Marina Dudarenko"
        desrciptionLabel.text = "UX/UI designer, web-designer Moscow, Russia"
        desrciptionLabel.lineBreakMode = .byWordWrapping
        desrciptionLabel.numberOfLines = 0
        
        saveButton.backgroundColor = .init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        saveButton.layer.cornerRadius = 14
        
        print(saveButton.frame)
        //frame с размерами iPhoneSE(2nd generation)в .storyboard
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(saveButton.frame)
        // frame с размерами после использования Auto layout на запускаемом симуляторе iPhone11Pro
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        //print(saveButton.frame)
        //frame в init недоступен, так как view ещё не загрузилась
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func photoSource(source: String) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if source == "photoLibrary" {
            imagePicker.sourceType = .photoLibrary
        } else if source == "camera" {
            imagePicker.sourceType = .camera
        }
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheetAlert(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Edit profile photo", preferredStyle: .actionSheet)
        let galleryButton = UIAlertAction(title: "Choose from the gallery", style: .default) { (_: UIAlertAction) in
            
            self.photoSource(source: "photoLibrary")
            
        }
        let cameraButton = UIAlertAction(title: "Take a photo", style: .default) { (_: UIAlertAction) in
            
            self.photoSource(source: "camera")
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(galleryButton)
        alert.addAction(cameraButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        weak var getImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        if self.isLabelsExist {
            self.firstLetterLabel.removeFromSuperview()
            self.secondLetterLabel.removeFromSuperview()
            
            self.isLabelsExist = false
        }
        imageView.contentMode = .scaleToFill
        imageView.image = getImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
