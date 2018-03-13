//
//  weatherCell.swift
//  lab6
//
//  Created by Max Moede on 2/8/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell {

    @IBOutlet weak var avgDir: UILabel!
    @IBOutlet weak var avgSpeed: UILabel!
    @IBOutlet weak var maxDir: UILabel!
    @IBOutlet weak var maxSpeed: UILabel!
    @IBOutlet weak var lowL: UILabel!
    @IBOutlet weak var highL: UILabel!
    @IBOutlet weak var conditions: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
