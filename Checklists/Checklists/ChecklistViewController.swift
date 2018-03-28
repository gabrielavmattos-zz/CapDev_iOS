//
//  ViewController.swift
//  Checklists
//
//  Created by Gabriela Mattos on 27/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    let row0text = "Walk the dog"
    let row1text = "Brush my teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 18h30
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = row0text
        } else if indexPath.row % 5  == 1 {
            label.text = row1text
        } else if indexPath.row % 5  == 2 {
            label.text = row2text
        } else if indexPath.row % 5  == 3 {
            label.text = row3text
        } else if indexPath.row % 5  == 4 {
            label.text = row4text
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }


}


