//
//  OffRoom.swift
//  RoomyNT
//
//  Created by AhmedMohamedIOS on 8/10/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import UIKit

class OffRoom: NSObject {
    class func getRoomsFromRealm(completion: @escaping (_ error: Error?, _ rooms: [Room]?) -> Void) {
        guard (UserDefaults.standard.object(forKey: "auth_token") as? String) != nil else {
            completion(nil, nil)
            return
        }
        var Rooms = [Room]()
        let offlineRooms = OfflineRoom()
        let offRooms = offlineRooms.readAllRoomsFromRealm()
        for data in offRooms
        {
            let room = Room()
            room.id = data.id
            room.descriptionText = data.descriptionText
            room.price = data.price
            room.address = data.address
            room.city = data.city
            room.descriptionPicLink = data.descriptionPicLink
            Rooms.append(room)
        }
        
    completion(nil, Rooms)
    }
}
