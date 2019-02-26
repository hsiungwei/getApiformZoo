//
//  Cell.swift
//  getApiformZoo
//
//  Created by HsiungWei on 2019/2/24.
//  Copyright © 2019 熊偉. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
