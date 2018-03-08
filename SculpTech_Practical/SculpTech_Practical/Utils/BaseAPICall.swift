//
//  BaseAPICall.swift
//  SculpTech_Practical
//
//  Created by VIJAY on 09/02/18.
//  Copyright © 2018 TestDemo. All rights reserved.
//

import UIKit
import Alamofire

class BaseAPICall: NSObject {

    static let sharedInstance = BaseAPICall()
    
    func postRequestUsingBody(Parameter param : NSDictionary, completionHandler : @escaping (_ result : NSArray?) -> ())
    {
        AppUtility.isNetworkAvailableWithBlock { (isAvailable) in
            if isAvailable == true {
                
                var requestURL : String! = "http://push.cartradernow.com/CarTrader/CarTrader_Service.svc/GetSellingList"

                var requset : URLRequest = URLRequest(url: URL(string: requestURL)!)
                requset.httpMethod = "POST"
                requset.allHTTPHeaderFields = ["Content-Type": "application/json"]
                requset.timeoutInterval = 30.0
                requset.httpBody = param.JSONString().data(using: String.Encoding.utf8.rawValue)

                Alamofire.request(requset).responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let responseJSON):
                        guard let dicResponse = responseJSON as? NSDictionary else{
                            return
                        }
                        var carList : [Car] = [Car]()
                        if let result : NSDictionary = dicResponse.value(forKey: "GetSellingListResult") as? NSDictionary {
                            if let sellingList : NSArray = result.value(forKey: "sellingList") as? NSArray {
                                for (_, dict) in sellingList.enumerated() {
                                    carList.append(Car(dict: dict as! NSDictionary))
                                }
                                completionHandler(carList as NSArray)
                            }
                            else {
                                completionHandler(nil)
                            }
                        }
                        break
                    case .failure(let error):
                        print("Eroor : ", error.localizedDescription)
                        completionHandler(nil)
                    }
                })
                requestURL = nil
            }
            else{
                completionHandler(nil)
            }
        }
    }
}

