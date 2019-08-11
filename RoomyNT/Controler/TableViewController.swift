//
//  TableViewController.swift
//  networklayer
//
//  Created by AhmedMohamedIOS on 8/5/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import UIKit


class TableViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    

var Rooms: [Room] = []
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    handleRooms()
    }
    @objc private func handleRooms() {
        if Connectivity.isConnectedToInternet() {
            Api.getRoomsFromBackend { (_: Error?, Rooms: [Room]?) in
                if let Rooms = Rooms {
                    self.Rooms = Rooms
                    self.TableView.reloadData()
                }
            }
            
        }
        else{
            OffRoom.getRoomsFromRealm { (_:Error?, Rooms:[Room]?) in
                if let Rooms = Rooms {
                    self.Rooms = Rooms
                    self.TableView.reloadData()
                }
            }
   
        }
    
    }
 
    @IBAction func SignOut(_ sender: UIButton) {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to logout?", preferredStyle: .alert)
        
        let mode1 = UIAlertAction(title: "Yes", style: .default, handler: {
            _ in
            UserDefaults.standard.removeObject(forKey: "auth_token")
            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main")
           self.present(tab, animated: true)
        })
        let mode2 = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(mode1)
        alert.addAction(mode2)
        
        present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterOfDetails"{
            let PassedRoom = segue.destination as! RoomDescription
            PassedRoom.Room = sender as? Room
        }
    }
}

extension TableViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = Rooms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as! RoomCell
        cell.setRoomInfo(Room: room)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let room = Rooms[indexPath.row]
        performSegue(withIdentifier: "masterTodetails", sender: room)
    }
    
}
