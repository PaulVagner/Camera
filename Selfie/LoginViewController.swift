//
//  LoginViewController.swift
//  Selfie
//
//  Created by Paul Vagner on 10/26/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
//@property (weak, nonatomic) IBOutlet UITextField *usernameFiled;
    
    @IBOutlet weak var passwordField: UITextField!
//@property (weak, nonatomic) IBOutlet UITextField *passwordField;
    
    
    
    @IBAction func loginButtonPressed(sender: UIButton) {
//- (IBAction)loginButtonPressed:(id)sender;
        
        
        PFUser.logInWithUsernameInBackground(self.usernameField.text!, password: self.passwordField.text!) { (user, error) in
//    [PFUser logInWithUsernameInBackground:self.usernameFiled.text password:self.passwordField.text block:^(PFUser *user, NSError *error){
            
            if user != nil {
//        if (user) {
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                let nc = storyboard.instantiateInitialViewController() as! UINavigationController
//        UINavigationController * nc = [mainStoryboard instantiateInitialViewController];
                
                UIApplication.sharedApplication().windows[0].rootViewController = nc
//        [UIApplication sharedApplication].windows[0].rootViewController = nc;
                
                
            } else {
//        } else {
                
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//- (void)viewDidLoad {
        
        
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo_blue"))
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_blue"]];
        
    }
    
    override func viewWillAppear(animated: Bool) {
//    - (void)viewWillAppear:(BOOL)animated {
        
        self.navigationController?.navigationBarHidden = false
//        self.navigationController.navigationBarHidden = NO;
        
    }
}

