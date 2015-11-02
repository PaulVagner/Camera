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
   
        let nc = userStoryboard.instantiateInitialViewController() //    UINavigationController * nc = [userStoryboard instantiateInitialViewController];
        
        UIApplication.sharedApplication().windows[0].rootViewController = nc
//    [UIApplication sharedApplication].windows[0].rootViewController = nc;
        
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//UIBarButtonItem * logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"GoAway" style:UIBarButtonItemStylePlain target:self action:@selector(logout)]
    let logoutButton: UIBarButtonItem = UIBarButtonItem(title: "logout", style: UIBarButtonItemStyle.Plain, target: UINavigationController.self, action: "logout")
    
    self.navigationItem.leftBarButtonItem = logoutButton
//self.navigationItem.leftBarButtonItem = logoutButton
    
    selfies = [].mutableCopy()
//selfies = [@[] mutableCopy]
    
    let selfieQuery: PFQuery = PFQuery.queryWithClassName("Selfie") {(objects: [AnyObject],error: NSErrorPointer) in for selfie: PFObject in objects {
//PFQuery * selfieQuery = [PFQuery queryWithClassName:@"Selfie"]
//[selfieQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//  for (PFObject * selfie in objects) {
        
        selfie.addObject(selfie)
//   [selfies addObject:selfie];
        
        }
    
        UITableView.reloadData()
        
        
    }
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    NSLog(@"%@",selfies);
//    
//    NSLog(@"current selfies count %d", (int)selfies.count);
//    return selfies.count;
//    
//    }
//    
//    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//        
//        SelfieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelfieCell" forIndexPath:indexPath];
//        
//        NSLog(@"setting selfie on cell");
//        cell.selfie = selfies[indexPath.row];
//        
//        return cell;
//        
//}












