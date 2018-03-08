//
//  CarListTableViewCell.swift
//  SculpTech_Practical
//
//  Created by VIJAY on 09/02/18.
//  Copyright © 2018 TestDemo. All rights reserved.
//

import UIKit
import Kingfisher

class CarListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblModel: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    
    @IBOutlet weak var lblNavigationIcon: UILabel!
    @IBOutlet weak var lblDistanceAway: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var carCollectionView: UICollectionView!
    
    var carImages : [String] = [String]()
    var carId : Int!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLayout(car : Car) {
        
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(1.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.black
        self.addSubview(additionalSeparator)
        
        self.carCollectionView.dataSource = self
        self.carCollectionView.delegate = self
        self.carImages = car.imagelist
        self.carId = car.id
        self.carCollectionView.reloadData()
        
        self.lblModel.text = "\(car.year) \(car.make)"
        self.lblLocation.text = car.status
        self.lblDistance.text = "\(car.distance) miles"
        self.lblPrice.text = " $ \(car.price) "
        
        
        self.lblNavigationIcon.font = UIFont.fontAwesome(ofSize: 15)
        self.lblNavigationIcon.text = String.fontAwesomeIcon(name: .plane)
        self.lblDistanceAway.text = "\(car.miles) miles away"
    }
    

}

extension CarListTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.carImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarImageCollectionViewCell", for: indexPath as IndexPath) as! CarImageCollectionViewCell
        
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        if let url : URL = URL(string: "http://push.cartradernow.com/CarTrader/images/advertiseImages/\(self.carId!)/\(self.carImages[indexPath.row])") {
                cell.imgCar.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }
}
