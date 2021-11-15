//
//  TableViewCell.swift
//  TableView
//
//  Created by Danil Goncharov on 15.11.2021.
//

import UIKit

final class TableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
       }
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    //Боремся с переиспользованием ячеек
    override func prepareForReuse() {
            super.prepareForReuse()
            self.accessoryType = .none
            self.accessoryView = .none
            self.detailTextLabel?.text = .none
        }
}
