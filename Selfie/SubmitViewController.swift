//
//  SubmitViewController.swift
//  Selfie
//
//  Created by Paul Vagner on 10/26/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit
import Parse

class SubmitViewController: UIViewController {

    @IBOutlet weak var captionTextView: UITextView!
// @property (weak, nonatomic) IBOutlet UITextView * captionTextView;
   
    @IBOutlet weak var filteredImageView: UIImageView!
//@property (weak, nonatomic) IBOutlet UIImageView *filteredImageView;

    var filteredImage: UIImage?
//    @property UIImage * filteredImage;
    
    
    override func viewWillAppear(animated: Bool) {
//- (void)viewWillAppear:(BOOL)animated {
        
    self.filteredImageView?.image = self.filteredImage
//    self.filteredImageView.image = self.filteredImage;
        
    }
    
    @IBAction func submitSelfie(sender: UIButton) {
//    - (IBAction)submitSelfie:(id)sender {
        
        let selfie: PFObject = PFObject(className: "Selfie")
//        PFObject * selfie = [PFObject objectWithClassName:@"Selfie"];
        
        if let imageData = UIImagePNGRepresentation(self.filteredImage!) {
//        NSData * imageData = UIImagePNGRepresentation(self.filteredImage);
     
            let imageFile = PFFile(data: imageData)
//        PFFile * imageFile = [PFFile fileWithData:imageData];
            
            selfie["image"] = imageFile
//        selfie[@"image"] = imageFile; //PFFile column
            
            selfie["caption"] = self.captionTextView.text //String column
//          selfie["caption"} = captionTextView.text
        
            selfie["user"] = PFUser.currentUser()
        
            selfie.saveInBackground()
        }
        
        
    }
}

