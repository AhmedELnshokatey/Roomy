//
//  Api.swift
//  networklayer
//
//  Created by AhmedMohamedIOS on 7/30/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class Api: NSObject {
    class func Login (email : String , password : String , Completion : @escaping ( _ error : Error?, _ success : Bool)->Void)
    {
        let login = URLs.login
        let par = ["email" : email , "password" : password]
        AF.request(login, method: HTTPMethod.post, parameters: par).validate().responseJSON{response in
            switch response.result{
            case .failure(let error):
                Completion(error ,false)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(value)
                let auth_token = json["auth_token"].string
                print(auth_token!)
                helper.saveToUserDef(auth_token: auth_token!)
                Completion(nil,true)

    }

}
}
    
    class func signUp (name: String,email:String,password: String, Completion : @escaping ( _ error : Error?, _ success : Bool)-> Void){
        let register = URLs.register
        let para = ["name" : name , "email" : email,"password" : password]
           AF.request(register, method: HTTPMethod.post, parameters: para).responseJSON{response in
            switch response.result{
            case .failure(let error):
                Completion(error ,false)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(value)
                let auth_token = json["auth_token"].string
            helper.saveToUserDef(auth_token: auth_token!)
                
                Completion(nil,true)
                
            }
            
        }
    }
    class func getRoomsFromBackend(completion: @escaping (_ error: Error?, _ rooms: [Room]?) -> Void) {
        guard let auth_token = UserDefaults.standard.object(forKey: "auth_token") as? String else {
            completion(nil, nil)
            return
        }
        
        let roomsEndpoint = URLs.rooms
        let headers: HTTPHeaders = ["Authorization": auth_token]
        
        AF.request(roomsEndpoint, method: HTTPMethod.get, parameters: nil, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                guard let json = JSON(value).array else {
                    completion(nil, nil)
                    return
                }
                
                var rooms = [Room]()
                for data in json {
                    guard let data = data.dictionary else {
                        return
                    }
                    let room = Room()
                    let offeRoom = OfflineRoom()
                    room.id = data["id"]?.int ?? 0
                    room.descriptionText = data["description"]?.string ?? ""
                    room.price = data["price"]?.string ?? "0$"
                    room.address = data["title"]?.string ?? "title"
                    room.city = data["place"]?.string ?? "place"
                    room.descriptionPicLink = data["image"]?.string ?? "image link"
                    rooms.append(room)
                    offeRoom.addRoomsToRealm(room: room)

                }
                completion(nil, rooms)

            }
        }
    }
    
    
}

    
    
    
    

