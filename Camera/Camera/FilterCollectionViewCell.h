//
//  FilterCollectionViewCell.h
//  Camera
//
//  Created by Paul Vagner on 10/19/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FilterCollectionViewCell : UICollectionViewCell


@property UIImage * originalImage;

@property NSString * filterName;



@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;





@end
