//
//  AppDelegate.swift
//  Selfie
//
//  Created by Paul Vagner on 10/26/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
//        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
//        [Parse setApplicationId:@"W071vUhpAfvZ02x0lOdASEuGVmDIF8zAn1Xzrndk" clientKey:@"Om4qopIp2jNXvnDHR55HxoEug1Rtr060VoWWQG0Y"];
//      
        Parse.setApplicationId("W071vUhpAfvZ02x0lOdASEuGVmDIF8zAn1Xzrndk", clientKey: "Om4qopIp2jNXvnDHR55HxoEug1Rtr060VoWWQG0Y")
        
//        UINavigationController * nc;
     
        var nc: UINavigationController?
        
        
        
//        if ([PFUser currentUser] != nil) {
        if PFUser.currentUser() != nil {
           
            //we are logged in

//            UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
           let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            if let mainNC = mainStoryboard.instantiateInitialViewController() as? UINavigationController {
            
//            nc = [mainStoryboard instantiateInitialViewController];
            nc = mainNC
           
    }
            
        } else {

//          //not logged in

//            UIStoryboard * userStoryboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
            
            let userStoryboard = UIStoryboard(name: "User", bundle: nil)
            
//                      nc = [userStoryboard instantiateInitialViewController];
            
            if let userNC = userStoryboard.instantiateInitialViewController() as? UINavigationController {
                
                nc = userNC
                
                
            }
            
        }
        
        
//            UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            nc = [mainStoryboard instantiateInitialViewController];
//            //we are logged in
//            
//        } else {
//            UIStoryboard * userStoryboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
//            nc = [userStoryboard instantiateInitialViewController];
//            //not logged in
//            
//        }
//        

        
//        self.window.rootViewController = nc;

        window?.rootViewController = nc
        

//        [self.window makeKeyAndVisible];
        
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

