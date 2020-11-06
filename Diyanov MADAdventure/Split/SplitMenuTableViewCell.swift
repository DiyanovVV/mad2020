//
//  SplitMenuTableViewCell.swift
//  Diyanov MADAdventure
//
//  Created by DiyanovVV on 06.11.2020.
//

import UIKit

class SplitMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var splitMenuImage: UIImageView!
    @IBOutlet weak var splitMenuLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
