//
//  RoomyDescription.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/11/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit

class RoomDescription: UIViewController {
    @IBOutlet private var descriptionPic: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    var Room: Room?

    override func viewDidLoad() {
        super.viewDidLoad()
       setUI()
    }

    func setUI(){
        descriptionPic.image = Room?.firstPic
        descriptionLabel.text = Room?.descriptionText
    }
}

