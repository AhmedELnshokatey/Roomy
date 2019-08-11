//
//  RoomCell.swift
//  networklayer
//
//  Created by AhmedMohamedIOS on 8/6/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var priceOfRoom: UILabel!
    @IBOutlet weak var numberOfBeds: UILabel!
    @IBOutlet weak var flatDetails: UILabel!
    @IBOutlet weak var nameOfRoom: UILabel!
    @IBOutlet weak var detailsOfRoom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setRoomInfo(Room:Room) {
        nameOfRoom.text = Room.address
        detailsOfRoom.text = Room.city
        priceOfRoom.text = Room.price
        flatDetails.text = String (Room.bath) + "Bath"
        numberOfBeds.text = String( Room.bed ) + "Beds"
        firstImage.image = Room.firstPic
        secondImage.image = Room.secondPic
        thirdImage.image = Room.thirdPic 
        
      
        
    }

}
