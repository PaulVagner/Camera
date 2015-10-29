//
//  SelfieTableViewController.swift

import UIKit

import Parse

class SelfieTableViewController: UITableViewController {

    var selfies: AnyObject?

    func logout() {
//    -(void)logout {
        PFUser.logOut()
//    [PFUser logOut];
        
        let userStoryboard: UIStoryboard = UIStoryboard(name: "User", bundle: nil)
//    UIStoryboard * userStoryboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
   
        let nc = userStoryboard.instantiateInitialViewController() as? UINavigationController
//    UINavigationController * nc = [userStoryboard instantiateInitialViewController];
        
        UIApplication.sharedApplication().windows[0].rootViewController = nc
//    [UIApplication sharedApplication].windows[0].rootViewController = nc;
        
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



}
