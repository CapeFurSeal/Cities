//
//  AppTableView.swift
//
//  Created by Blake Loizides on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
  class internal func setupAppTableview (tableview: UITableView,
                                         delegate: UITableViewDelegate,
                                         dataSource: UITableViewDataSource,
                                         backGroundColor: UIColor,
                                         allowsMultipleSelection: Bool,
                                         contentInset:UIEdgeInsets) {
    tableview.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    tableview.delegate = delegate
    tableview.dataSource = dataSource
    tableview.contentInset = contentInset
    tableview.allowsMultipleSelection = allowsMultipleSelection
    tableview.isScrollEnabled = true
    tableview.backgroundColor = backGroundColor
  }
}
