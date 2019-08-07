//
//  PlayerCell.swift
//  TableViewCellWithButtonActionUsingClosure
//
//  Created by Sherif on 7/12/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerClubName: UILabel!
    @IBOutlet weak var playerInfoButton: UIButton!
    
    var tapInfoClosure : (() -> ())?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectionStyle = .none
    }
    
    
    func configPlayerCell(player : Player){
        playerNameLabel.text = player.palyerName
        playerClubName.text = player.playerClub
    }
    
    @IBAction func playerInfoButtonAction(_ sender: Any) {
        tapInfoClosure?()
    }
    
}
