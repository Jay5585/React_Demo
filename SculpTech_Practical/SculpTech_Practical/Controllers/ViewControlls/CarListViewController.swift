//
//  CarListViewController.swift
//  SculpTech_Practical
//
//  Created by VIJAY on 09/02/18.
//  Copyright © 2018 TestDemo. All rights reserved.
//

import UIKit
import FontAwesome_swift

class CarListViewController: UIViewController {

    @IBOutlet weak var topLocationView: UIView!
    @IBOutlet weak var lblLocationIcon: UILabel!
    @IBOutlet weak var tblCarList: UITableView!
    
    var carList : [Car] = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblLocationIcon.font = UIFont.fontAwesome(ofSize: 30)
        lblLocationIcon.text = String.fontAwesomeIcon(name: .mapMarker)
        lblLocationIcon.textColor = UIColor.orange
        topLocationView.layer.borderWidth = 0.5
        topLocationView.layer.borderColor = UIColor.black.cgColor
        
        tblCarList.tableFooterView = UIView()
        
        let dicParam : NSDictionary = ["latitude":"37.765205","longitude":"-122.241638","pageIndex":"1","pageSize":"50","sorttype":"-1"]
        
        let parmas : NSDictionary = ["request":dicParam]
        
        BaseAPICall.sharedInstance.postRequestUsingBody(Parameter: parmas) { (response) in
            if let list : [Car] = response as? [Car] {
                self.carList = list
                self.tblCarList.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CarListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarListTableViewCell", for: indexPath) as! CarListTableViewCell
        
        cell.setLayout(car: self.carList[indexPath.row])
        return cell
    }
    
    
    
    
}
