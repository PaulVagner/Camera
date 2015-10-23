//
//  RegisterViewController.m
//  Camera
//
//  Created by Paul Vagner on 10/19/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

#import "RegisterViewController.h"

#import <Parse/Parse.h>

@interface RegisterViewController ()

- (IBAction)registerButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UITextField *emailField;




@end

@implementation RegisterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)registerButtonPressed:(id)sender {

    PFUser * user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.passwordField.text;
    user.email = self.emailField.text;
    
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {   // Hooray! Let them use the app now.
            
            NSLog(@"signed up");
            
            UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController * nc = [mainStoryboard instantiateInitialViewController];
            
            [UIApplication sharedApplication].windows[0].rootViewController = nc;

            
        } else {
            
            NSString * errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
        }
    }];
    
}




@end
