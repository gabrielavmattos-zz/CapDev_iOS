//
//  FirstViewController.swift
//  DelegateExample
//
//  Created by Gabriela Mattos on 29/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, SecondViewControllerDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToNext() {
        let second = SecondViewController(nibName: "SecondViewController", bundle: nil)
        
        second.value = textField.text
        second.delegate = self
        
        navigationController?.pushViewController(second, animated: true)
    }
    
    func onValueChanged(newValue: String) {
        textField.text = newValue
    }

}
