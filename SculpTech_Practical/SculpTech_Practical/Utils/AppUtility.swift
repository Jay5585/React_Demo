//
//  AppUtility.swift
//  SculpTech_Practical
//
//  Created by VIJAY on 09/02/18.
//  Copyright © 2018 TestDemo. All rights reserved.
//

import UIKit
import SystemConfiguration

class AppUtility: NSObject {
    class func isNetworkAvailableWithBlock(_ completion: @escaping (_ wasSuccessful: Bool) -> Void) {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            completion(false)
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        completion(isReachable && !needsConnection )
        
    }
}

