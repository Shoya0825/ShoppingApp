//
//  ItemPhotoCollectionViewCell.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/07.
//

import UIKit

class ItemPhotoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var itemPhotoCountLabel: UILabel!
    @IBOutlet weak var itemPhotoImageView: DesignableImageView!
    @IBOutlet weak var cameraButtonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
