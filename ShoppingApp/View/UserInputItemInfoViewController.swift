//
//  UserInputItemInfoViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/03.
//

import UIKit

class UserInputItemInfoViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ItemPhotoCellDelegate {
    
    @IBOutlet var infoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTableView.delegate = self
        
        
        infoTableView.register(UINib(nibName: "ItemPhotoCell", bundle: nil), forCellReuseIdentifier: "ItemPhotoCell")
        infoTableView.register(UINib(nibName: "ItemMainInfoCell", bundle: nil), forCellReuseIdentifier: "ItemMainInfoCell")
        infoTableView.register(UINib(nibName: "ItemPriceCell", bundle: nil), forCellReuseIdentifier: "ItemPriceCell")
        
    }
    
    enum UserInputCell: Int, CaseIterable {
        case firstInputCell
        case secondInputCell
        case thirdInputCell
        
        var cellIdentifier: String {
            switch self {
            case .firstInputCell: return "ItemPhotoCell"
            case .secondInputCell: return "ItemMainInfoCell"
            case .thirdInputCell: return "ItemPriceCell"
            }
        }
        var cellHeight: CGFloat {
            switch self {
            case .firstInputCell: return 150
            case .secondInputCell: return 500
            case .thirdInputCell: return 100
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserInputCell.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellIndexPath = UserInputCell(rawValue: indexPath.row)!
        
        return cellIndexPath.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndexPath = UserInputCell(rawValue: indexPath.row)!
        
        switch cellIndexPath {
        case .firstInputCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIndexPath.cellIdentifier) as! ItemPhotoCell
            cell.delegate = self
            return cell
        case .secondInputCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIndexPath.cellIdentifier) as! ItemMainInfoCell
            return cell
        case .thirdInputCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIndexPath.cellIdentifier) as! ItemPriceCell
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func didTappedItemPhotoCell(_ itemPhotoCell: ItemPhotoCell) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }

        dismiss(animated: true)
        
        NotificationCenter.default.post(name: .notificationName, object: nil, userInfo: ["itemPhoto": image])
    }
    
}
extension Notification.Name {
    static let notificationName = Notification.Name("notificationName")
}
