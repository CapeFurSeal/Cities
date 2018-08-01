//
//  CitiesTableViewCell.swift
//  Cities
//
//  Created by Blake Loizides on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
  
  @IBOutlet weak var cityNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
}
