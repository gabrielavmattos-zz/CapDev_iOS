//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Gabriela Mattos on 28/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
