//
//  ItemPhotoCollectionViewCell.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/07.
//

import UIKit

class ItemPhotoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var itemPhotoCountLabel: UILabel!
    @IBOutlet weak var cameraButtonView: UIView!
    @IBOutlet weak var itemPhotoImageView: DesignableImageView!
    @IBOutlet weak var requiredLabel: UILabel!
    @IBOutlet weak var cameraImageView: UIImageView!
    @IBOutlet weak var cameraImageViewCenterYConst: NSLayoutConstraint!
    @IBOutlet weak var cameraImageViewTopConst: NSLayoutConstraint!
    @IBOutlet weak var cameraImageViewBottomConst: NSLayoutConstraint!
    
    
    var itemPhotoImage: UIImage? {
        didSet {
            if let image = itemPhotoImage {
                itemPhotoImageView.image = image
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
