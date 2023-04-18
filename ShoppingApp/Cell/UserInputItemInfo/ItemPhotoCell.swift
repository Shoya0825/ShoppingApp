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
    
    var firstPhoto: UIImage?
    var itemPhotoList: [UIImage?] = []
    
    var didTappedIndexPathRow: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemPhotoCollectionView.delegate = self
        itemPhotoCollectionView.dataSource = self
        
        itemPhotoCollectionView.register(UINib(nibName: "ItemPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemPhotoCollectionViewCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotificationFromVC), name: .notificationName, object: nil)
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
        
        setupItemPhotoListView(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row <= itemPhotoList.count {
            checkCameraAuthorization { authorized in
                if authorized {
                    self.didTappedIndexPathRow = indexPath.row
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
    
    private func setupItemPhotoListView(cell: ItemPhotoCollectionViewCell, indexPath: IndexPath) {
        cell.itemPhotoCountLabel.text = String(indexPath.row + 1)
        
        if itemPhotoList.count == (indexPath.row) + 1 {
            cell.itemPhotoImage = itemPhotoList[indexPath.row]
        }
        
        // 2枚目以降のImageViewの設定
        if indexPath.row == 0 {
            cell.cameraButtonView.isHidden = cell.itemPhotoImage != nil
            
        } else {
            if itemPhotoList.count == indexPath.row {
                cell.cameraButtonView.isHidden = false
                cell.requiredLabel.isHidden = true
                cell.cameraImageView.tintColor = UIColor.systemGray
                cell.cameraImageViewTopConst.isActive = false
                cell.cameraImageViewTopConst.isActive = false
                cell.cameraImageViewCenterYConst.isActive = true
            }
        }
    }
    
    // カメラで写真撮影時にnotificationと画像を受け取る
    @objc private func didGetNotificationFromVC(notification: NSNotification?) {
        guard let imageData = notification?.userInfo!["itemPhoto"] as? UIImage else { return }
        
        
        // 想定通りの順番に画像データが入らない
        if itemPhotoList.count == 0 {
            itemPhotoList.append(imageData)
            
        } else {
            
            if itemPhotoList.count == didTappedIndexPathRow {
                itemPhotoList.append(imageData)
                
            } else {
                itemPhotoList[didTappedIndexPathRow!] = imageData
            }
        }
        
        itemPhotoCollectionView.reloadData()
    }
}

protocol ItemPhotoCellDelegate {
    func didTappedItemPhotoCell(_ itemPhotoCell: ItemPhotoCell)
}
