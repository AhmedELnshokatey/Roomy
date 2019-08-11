//
//  RoomInfo.swift
//  networklayer
//
//  Created by AhmedMohamedIOS on 8/5/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import Foundation
import UIKit

class Room: NSObject {
    var id: Int = 0
    var address: String = ""
    var city: String = ""
    var price: String = ""
    var bed: Int = 0
    var bath: Int = 0
    var firstPic: UIImage = UIImage(named: "Placeholder")!
    var secondPic: UIImage = UIImage(named: "Placeholder")!
    var thirdPic: UIImage = UIImage(named: "Placeholder")!
    var descriptionText: String = ""
    var descriptionPicLink: String = ""
    var descriptionPic: UIImageView = UIImageView()
}


