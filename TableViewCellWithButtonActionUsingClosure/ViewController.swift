//
//  ViewController.swift
//  TableViewCellWithButtonActionUsingClosure
//
//  Created by Sherif on 7/12/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let players = [
             Player(palyerName: "Cristiano Ronaldo", playerClub: "Juventos", playerAge: 33, playerHeight: 187),
             Player(palyerName: "Messi", playerClub: "Barcelona", playerAge: 31, playerHeight: 167),
             Player(palyerName: "Mohamed Salah", playerClub: "Liverpool", playerAge: 27, playerHeight: 170),
             Player(palyerName: "Sadio Mane", playerClub: "Liverpool", playerAge: 29, playerHeight: 180),
             Player(palyerName: "Neymar", playerClub: "PSG", playerAge: 26, playerHeight: 182)
                ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = players[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as! PlayerCell
        cell.configPlayerCell(player: player)
        cell.tapInfoClosure = { [weak self] in
            
            self?.showAlert(message: "The Age is \(player.playerAge) , And the Height is \(player.playerHeight)")
            
            }
        
        return cell
    }

    //Helper func to show alert
    
    func showAlert (message : String){
        let alert = UIAlertController(title: "Player Info", message: message, preferredStyle: .alert)
        let action =  UIAlertAction(title: "Ok", style: .default, handler: .none)
        alert.addAction(action)
        present(alert , animated: true , completion: nil)
        
    }
    
}

