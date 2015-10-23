//
//  CaptureViewController.m
//  Camera
//
//  Created by Paul Vagner on 10/19/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

#import "CaptureViewController.h"

#import "FilterViewController.h"

#import "ImageEditing.h"

@interface CaptureViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *cameraHolderView;

@property UIImagePickerController * picker;



@end

@implementation CaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self.view setNeedsUpdateConstraints];
//    [self.view setNeedsLayout];
    
    
    self.picker = [[UIImagePickerController alloc] init]; //Setter
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera; //Getter
    self.picker.delegate = self;
    self.picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    self.picker.showsCameraControls = NO; //removes camera controls since Im using custom button.
    
    self.picker.view.frame = self.cameraHolderView.bounds;
    //self.picker.view.frame.size.width = newWidth; <- SWIFT
    
    [self.cameraHolderView addSubview:self.picker.view];
    
    
    
    
}

- (void)viewDidLayoutSubviews {
    
    

    
    NSLog(@"%f %f", self.cameraHolderView.bounds.size.width,self.cameraHolderView.bounds.size.height);
    
    CGRect newFrame = self.picker.view.frame;
    
    //    CGFloat newWidth = newFrame.size.height / 4 * 3;
    
    newFrame.size.width = newFrame.size.height / 4 * 3.1;
    
    newFrame.origin.x = (self.cameraHolderView.frame.size.width - newFrame.size.width) / 2;
    
    NSLog(@"%f %f", newFrame.size.width,newFrame.size.height);
    
    self.picker.view.frame = newFrame;
    
    
    
}



- (IBAction)takePicture:(id)sender {

    [self.picker takePicture];


}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    
    FilterViewController * filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterVC"];
    
    //pass the image
    
    
    
    filterVC.originalImage = flipImage(image);
    
//    filterVC.originalImage = image;
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
    
}


@end
