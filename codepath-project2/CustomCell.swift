//
//  CustomCell.swift
//  codepath-project2
//
//  Created by Vaibhav on 07/03/23.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var posterLabel: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
