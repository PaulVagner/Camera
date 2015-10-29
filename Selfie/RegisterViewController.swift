//
//  RegisterViewController.swift
//  Selfie
//
//  Created by Paul Vagner on 10/26/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import Parse

class RegisterViewController: UIViewController {
    
    @IBAction func registerButtonPressed(sender: UIButton) {
//- (IBAction)registerButtonPressed:(id)sender;

        let user = PFUser()
//    PFUser * user = [PFUser user];
        
        user.username = usernameField.text
//    user.username = self.usernameField.text;
        
        user.password = passwordField.text
//    user.password = self.passwordField.text;
        
        user.email = emailField.text
//    user.email = self.emailField.text;
        
        user.signUpInBackgroundWithBlock {
//    [user signUpInBackgroundWithBlock:^
            
            (succeeded: Bool, error) -> Void in
// (BOOL succeeded, NSError *error) {
            
            if error == nil {
//        if (!error) {
                
                
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                let nc = mainStoryboard.instantiateInitialViewController()
//        UINavigationController * nc = [mainStoryboard instantiateInitialViewController];
                
                UIApplication.sharedApplication().windows[0].rootViewController = nc
//        [UIApplication sharedApplication].windows[0].rootViewController = nc;
                
            } else {
//        } else {
                
                let errorString = error!.userInfo["error"] as? NSString
                
                print(errorString)
//        NSString * errorString = [error userInfo][@"error"];
            }
            
        }
        
    }
    
    @IBOutlet weak var usernameField: UITextField!
    //@property (weak, nonatomic) IBOutlet UITextField *usernameField;
    
    @IBOutlet weak var passwordField: UITextField!
    //@property (weak, nonatomic) IBOutlet UITextField *passwordField;
    
    @IBOutlet weak var emailField: UITextField!
    //@property (weak, nonatomic) IBOutlet UITextField *emailField;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}



