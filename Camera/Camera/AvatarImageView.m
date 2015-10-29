//
//  AvatarImageView.m
//  Camera
//
//  Created by Paul Vagner on 10/23/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

#import "AvatarImageView.h"

@implementation AvatarImageView


- (void)layoutSubviews {
    //runs after the constraints have changed
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.masksToBounds = YES;
    
}

- (void)prepareForInterfaceBuilder {
    
    
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.masksToBounds = YES;
    
}

@end
