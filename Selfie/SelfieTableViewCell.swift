


import UIKit

import Parse

class SelfieTableViewCell: UITableViewCell {

  // @property (weak, nonatomic) IBOutlet UIImageView *selfieImageView;

    @IBOutlet weak var selfieImageView: UIImageView! 
    
    var selfie: PFObject? {
        
        didSet {
            
//            [self updateInfo];
            
        }
        
    }

    func updateInfo() {
        
        let userImageFile = selfie?["image"] as? PFFile
//        PFFile * userImageFile = self.selfie[@"image"];
        
        userImageFile?.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
//        [userImageFile getDataInBackgroundWithBlock:^(NSData * imageData, NSError *error) {
            
            if error == nil {
//            if (!error) {
                
                self.selfieImageView.image = UIImage(data: imageData!)
//            self.selfieImageView.image = [UIImage imageWithData:imageData];
                
            }
            
        })

        
    }
    


}
