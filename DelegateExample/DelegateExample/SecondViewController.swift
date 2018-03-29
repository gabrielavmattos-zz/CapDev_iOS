//
//  SecondViewController.swift
//  DelegateExample
//
//  Created by Gabriela Mattos on 29/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func onValueChanged(newValue: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var value: String?
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = value {
            textField.text = text
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.onValueChanged(newValue: textField.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
