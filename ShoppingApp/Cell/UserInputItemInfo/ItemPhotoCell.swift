//
//  UserInputItemInfoPhotoCell.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/03.
//

import UIKit
import AVFoundation

class ItemPhotoCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var itemPhotoCollectionView: UICollectionView!
    var delegate: ItemPhotoCellDelegate?
    
    let alert = AlertController()
    var itemPhotoImage: UIImage?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemPhotoCollectionView.delegate = self
        itemPhotoCollectionView.dataSource = self
        
        itemPhotoCollectionView.register(UINib(nibName: "ItemPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemPhotoCollectionViewCell")
    }
    
    enum ItemPhotoCell: Int, CaseIterable {
        case firstCell
        case secondCell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemPhotoCollectionViewCell", for: indexPath) as! ItemPhotoCollectionViewCell
        
        cell.itemPhotoCountLabel.text = String(indexPath.row + 1)
        
        if indexPath.row == 0 {
            cell.cameraButtonView.isHidden = false
        }
        cell.itemPhotoImageView.image = itemPhotoImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            checkCameraAuthorization { authorized in
                if authorized {
                    self.delegate?.didTappedItemPhotoCell(self)
                } else {
                    self.alert.showCameraPermissionAlert()
                }
            }
        }
    }
    
    private func checkCameraAuthorization(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        case .authorized:
            completion(true)
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        
        itemPhotoImage = image
        itemPhotoCollectionView.reloadData()
        picker.dismiss(animated: true)
    }
}

protocol ItemPhotoCellDelegate {
    func didTappedItemPhotoCell(_ itemPhotoCell: ItemPhotoCell)
}
