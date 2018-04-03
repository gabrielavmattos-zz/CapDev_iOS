//
//  DataModel.swift
//  Checklists
//
//  Created by Gabriela Mattos on 02/04/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import Foundation

class DataModel {
    
    class func nextChecklistItemID() -> Int {
        let userDefaults = UserDefaults.standard
        let itemID = userDefaults.integer(forKey: "ChecklistItemID")
        userDefaults.set(itemID + 1, forKey: "ChecklistItemID")
        userDefaults.synchronize()
        return itemID
    }
}
