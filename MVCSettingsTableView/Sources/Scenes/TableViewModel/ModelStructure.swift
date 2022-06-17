//
//  ModelStructure.swift
//  TableView
//
//  Created by Danil Goncharov on 17.11.2021.
//

import UIKit

struct Section {
    let title: String
    let content: [ItemModel]
}

enum CellType {
    case normal
    case switchable
    case description
}

struct ItemModel {
    let type: CellType
    let title: String
    let image: UIImage?
    var descr: String? = nil
}
