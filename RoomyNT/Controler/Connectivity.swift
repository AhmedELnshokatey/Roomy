//
//  Connectivity.swift
//  Roomy
//
//  Created by AhmedMohamedIOS on 7/22/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
