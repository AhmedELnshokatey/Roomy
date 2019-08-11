//
//  Offline DB.swift
//  RoomyNT
//
//  Created by AhmedMohamedIOS on 8/10/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class OfflineRoom : Object
{    @objc dynamic var id: Int = 100
    @objc dynamic var address: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var bed: Int = 0
    @objc dynamic var bath: Int = 0
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var descriptionPicLink: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func addRoomsToRealm (room: Room){
        let realm = try! Realm()
        try! realm.write {
            let offlineRoom =  OfflineRoom()
            offlineRoom.id = room.id
            offlineRoom.address = room.address
            offlineRoom.city = room.city
            offlineRoom.price = room.price
            offlineRoom.bed = room.bed
            offlineRoom.bath = room.bath
            offlineRoom.descriptionText = room.descriptionText
            offlineRoom.descriptionPicLink = room.descriptionPicLink
            realm.add(offlineRoom, update: .modified)
        }
    }
    func readAllRoomsFromRealm() -> Results <OfflineRoom>{
        let realm = try! Realm()
        let rooms = realm.objects(OfflineRoom.self)
        return rooms
    }
    
}
