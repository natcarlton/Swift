//
//  MyFriendTableViewCell.swift
//  FriendsApp
//
//  Created by Natasha Carlton on 2/21/23.
//  nancarl@iu.edu
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
