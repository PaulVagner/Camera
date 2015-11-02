//
//  FilterCollectionViewCell.swift
//  Selfie
//
//  Created by Paul Vagner on 10/26/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import Parse

class FilterCollectionViewCell: UICollectionViewCell {
    
    //    @property UIImage * originalImage;
    
    var originalImage: UIImage?
    
    
    //    @property NSString * filterName;
    
    var filterName: String?
    
    //    @property (weak, nonatomic) IBOutlet UIImageView *filterImageView;
    
    @IBOutlet weak var filterImageView: UIImageView!
    
    
    override func didMoveToWindow() {
        //- (void)didMoveToWindow {
        runFilterInBackground()
        // [self runFilterInBackground]
    }
    
    override func prepareForReuse() {
        //    - (void)prepareForReuse {
        filterImageView.image = nil
        //      self.filterImageView.image = nil
        runFilterInBackground()
        //    [self runFilterInBackground]
    }
    
    func runFilterInBackground () {
        //    - (void)runFilterInBackground {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            //       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            let filteredImage: UIImage = filterImage(self.originalImage!, filterName: self.filterName!)
            //      UIImage * filteredImage = filterImage(self.originalImage, self.filterName);
            dispatch_async(dispatch_get_main_queue(), {
                //                dispatch_async(dispatch_get_main_queue(), ^{
                
                self.filterImageView.image = filteredImage
                //      self.filterImageView.image = filteredImage
                
            })
            
        })
    }
    
}
