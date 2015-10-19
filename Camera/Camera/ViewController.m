////
////  ViewController.m
////  Camera
////
////  Created by Paul Vagner on 10/19/15.
////  Copyright © 2015 Paul Vagner. All rights reserved.
////
//
//#import "ViewController.h"
//
//@interface ViewController ()
//
//@end
//
////@implementation ViewController
////
////- (UIView *)createBox:(CGRect)frame {
////    // "*" <- denotes that it is a pointer
////    UIView * view = [[UIView alloc] initWithFrame:frame];
////    //SWIFT: let view = UIView(frame: frame)
////
////
////    //This points to the same exact location in memory as UIView * view = [[UIView alloc] initWithFrame:frame]
////    UIView * view2 = view;
////
////    view = [[UIView alloc] init];
////
////
////    int num1 = 5;
////
////    int num2 = num1;
////
////
////    return view;
////
////}
//
//@implementation ViewController
//
//@synthesize names=_names;
//
//- (void)setNames:(NSArray *)names {
////SETTER method "_" <- expresses that it is an instance variable
//    _names = names;
//
//}
//
//- (NSArray *)names {
//
//    if (_names == nil) { _names = @[]; }
//
//    //GETTER method
//    return _names;
//
//}
//
//- (void)viewDIDLoad {
//    [super viewDidLoad];
//
//   // self.names = @[@"Mac", @"Joe", @"Kelly", @"Paul"];
//
//    NSArray * myNames = self.names;
//
//    _names = @[@"Mac", @"Joe", @"Kelly", @"Paul"];
//
//}
//
//
//@end
//


#import "ViewController.h"

#import <MobileCoreServices/MobileCoreServices.h>



@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property UIImagePickerController * pickerController;

@property (weak, nonatomic) IBOutlet UIImageView * mySelfieImageView;





@end

@implementation ViewController
//initWithCoder only initialized when it starts in storyboard
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        
        self.pickerController = [[UIImagePickerController alloc] init];
    
        self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        self.pickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        
        self.pickerController.delegate = self;
        
        
        
        
    }
    
    return self;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
     

    
//    [self.view addSubview:self.pickerController.view];

    if (self.mySelfieImageView.image == nil) {
    
    [self presentViewController:self.pickerController animated:YES completion:nil];
    
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSString * type = info[UIImagePickerControllerMediaType];
    
    if (type == (NSString *)kUTTypeImage) {
      
        UIImage * image = info[UIImagePickerControllerOriginalImage];
        
        self.mySelfieImageView.image = image;
        
        
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

@end











