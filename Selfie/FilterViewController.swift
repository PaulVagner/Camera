//
//  FilterViewController.swift
//  Selfie
//
//  Created by Paul Vagner on 10/26/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var originalImage: UIImage?
    
    //    @property UIImage * originalImage;
    
    @IBOutlet weak var filterImageView: UIImageView!
    
    //    @property (weak, nonatomic) IBOutlet UIImageView * filterImageView;
    
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    //    @property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;
    
    var filterNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filterImageView.image = self.originalImage
        self.filterCollectionView.dataSource = self
        self.filterCollectionView.delegate = self
        filterNames = CIFilter.filterNamesInCategories(nil)
        print(filterNames)
        filterCollectionView.reloadData()
        
        // Do any additional setup after loading the view.
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filterNames.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FilterCell", forIndexPath: indexPath) as! FilterCollectionViewCell
        
        cell.filterName = filterNames[indexPath.item]
        
        let resizedImage: UIImage = resizeImage(self.originalImage!, newSize: CGSizeMake(80, 80))
        
        cell.originalImage = resizedImage
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! FilterCollectionViewCell
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            
            let filteredImage: UIImage = filterImage(self.originalImage!, filterName: cell.filterName!)
            
            dispatch_async(dispatch_get_main_queue(), {
                
                self.filterImageView.image = filteredImage
                
            })
            
        })
    }
    
    @IBAction func pressedNext(sender: AnyObject) {
        
        let submitVC = storyboard?.instantiateViewControllerWithIdentifier("SubmitVC") as! SubmitViewController
        
        submitVC.filteredImage = self.filterImageView?.image
        
        self.navigationController?.pushViewController(submitVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
