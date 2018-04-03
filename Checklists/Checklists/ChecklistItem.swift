//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Gabriela Mattos on 28/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import Foundation

class ChecklistItem {
    
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    var text = ""
    var checked = false
    
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    func toggleChecked() {
        checked = !checked
    }
}
