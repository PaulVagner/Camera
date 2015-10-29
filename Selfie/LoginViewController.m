//
//  LoginViewController.m
//  Camera
//
//  Created by Paul Vagner on 10/19/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

#import "LoginViewController.h"

#import <Parse/Parse.h>

@interface LoginViewController ()


- (IBAction)loginButtonPressed:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *usernameFiled;



@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_blue"]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBarHidden = NO;
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonPressed:(id)sender {
    
    [PFUser logInWithUsernameInBackground:self.usernameFiled.text password:self.passwordField.text block:^(PFUser *user, NSError *error){

        
        
        if (user) {
            NSLog(@"Logged In");
            
            UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UINavigationController * nc = [mainStoryboard instantiateInitialViewController];
            
            [UIApplication sharedApplication].windows[0].rootViewController = nc;

            
        } else {
            // The login failed. Check error to see why.
        }
                                        
                                        
    }];
    
}
@end
