//
//  SelfieTableViewController.swift

import UIKit

import Parse

class SelfieTableViewController: UITableViewController {
    
    var selfies: [PFObject] = []
    
    func logout() {
        //    -(void)logout {
        PFUser.logOut()
        //    [PFUser logOut];
        
        let userStoryboard = UIStoryboard(name: "User", bundle: nil)
        //    UIStoryboard * userStoryboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
        
        let nc = userStoryboard.instantiateInitialViewController() //    UINavigationController * nc = [userStoryboard instantiateInitialViewController];
        
        UIApplication.sharedApplication().windows[0].rootViewController = nc
        //    [UIApplication sharedApplication].windows[0].rootViewController = nc;
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIBarButtonItem * logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"GoAway" style:UIBarButtonItemStylePlain target:self action:@selector(logout)]
        let logoutButton: UIBarButtonItem = UIBarButtonItem(title: "logout", style: UIBarButtonItemStyle.Plain, target: UINavigationController.self, action: "logout")
        
        navigationItem.leftBarButtonItem = logoutButton
        //self.navigationItem.leftBarButtonItem = logoutButton
        
        selfies = []
        //selfies = [@[] mutableCopy]
        
        let selfieQuery: PFQuery = PFQuery(className: "Selfie")
        //PFQuery * selfieQuery = [PFQuery queryWithClassName:@"Selfie"]
            
            
            selfieQuery.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
           //[selfieQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                
                if let objects = objects {
                
                for selfie: PFObject in objects {
                //  for (PFObject * selfie in objects) {
                    
                    
                    self.selfies.append(selfie)
                    //   [selfies addObject:selfie];
                    
                
                    }
                }
                self.tableView.reloadData()
                
                })
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        
        return selfies.count
    //    return selfies.count
    
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SelfieCell", forIndexPath: indexPath) as! SelfieTableViewCell
//        SelfieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelfieCell" forIndexPath:indexPath];
        
        
        cell.selfie = selfies[indexPath.row]
//        cell.selfie = selfies[indexPath.row];
        
        return cell
//        return cell;

    }

}












