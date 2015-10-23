//
//  SelfieTableViewController.m
//  Camera
//
//  Created by Paul Vagner on 10/19/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

#import "SelfieTableViewController.h"

#import "SelfieTableViewCell.h"

@interface SelfieTableViewController ()

@end

@implementation SelfieTableViewController

{

    NSMutableArray * selfies;
    
    
}

-(void)logout {
    
    [PFUser logOut];
    
    UIStoryboard * userStoryboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UINavigationController * nc = [userStoryboard instantiateInitialViewController];
    
    [UIApplication sharedApplication].windows[0].rootViewController = nc;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ///// LogOut Button
    
    
    UIBarButtonItem * logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"GoAway" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
    
//    self.navigationController.navigationItem.leftBarButtonItem = logoutButton; <--- DO NOT USE THIS TYPE OF CODE
    
    self.navigationItem.leftBarButtonItem = logoutButton;
    
    NSLog(@"%@", self.navigationController.navigationItem);
    NSLog(@"%@", self.navigationItem);
    
    ///////
    
    selfies = [@[] mutableCopy];
    
    NSLog(@"viewDidLoad");
    
    PFQuery * selfieQuery = [PFQuery queryWithClassName:@"Selfie"];
    
    [selfieQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        for (PFObject * selfie in objects) {
            
            NSLog(@"%@", selfie);
            [selfies addObject:selfie];
        }
        
        
        
        NSLog(@"query did finish");
        
        [self.tableView reloadData];
        
    }];
    
  }


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows

    NSLog(@"%@", selfies);
    
    NSLog(@"current selfies count %d", (int)selfies.count);

    return selfies.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SelfieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SelfieCell" forIndexPath:indexPath];
    
    
    
    cell.selfie = selfies[indexPath.row];
    
    
    return cell;
    
}



@end
