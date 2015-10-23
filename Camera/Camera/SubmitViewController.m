//
//  SubmitViewController.m
//  Camera
//
//  Created by Paul Vagner on 10/19/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

#import "SubmitViewController.h"

#import <Parse/Parse.h>

@interface SubmitViewController ()

@property (weak, nonatomic) IBOutlet UITextView * captionTextView;

@property (weak, nonatomic) IBOutlet UIImageView *filteredImageView;

@end



@implementation SubmitViewController


- (void)viewWillAppear:(BOOL)animated {
    
    self.filteredImageView.image = self.filteredImage;
    
}

- (IBAction)submitSelfie:(id)sender {

    PFObject * selfie = [PFObject objectWithClassName:@"Selfie"];

    
    //turn UIImage into NSData (basically getting the raw data)
    NSData * imageData = UIImagePNGRepresentation(self.filteredImage);
    
    
    //create a Parse File with the raw data, so that it can store the image
    PFFile * imageFile = [PFFile fileWithData:imageData];
    
    selfie[@"image"] = imageFile; //PFFile column
    
    //let selfie = PFObject(className:"Selfie")
    
    selfie[@"caption"] = self.captionTextView.text; //String column

    //selfie["caption"} = captionTextView.text
    selfie[@"user"] = [PFUser currentUser]; // pointer -> _User column
    //[selfie save];
    [selfie saveInBackground];
    
}

@end
