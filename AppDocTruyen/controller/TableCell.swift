//
//  TableCell.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/21/22.
//

import UIKit

class TableCell: UITableViewCell {
    @IBOutlet weak var imgTruyen: UIImageView!
    
    @IBOutlet weak var lbTheloai: UILabel!
    @IBOutlet weak var lbTacgia: UILabel!
    
    @IBOutlet weak var lbTruyen: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
