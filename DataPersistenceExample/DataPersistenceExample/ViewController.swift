//
//  ViewController.swift
//  DataPersistenceExample
//
//  Created by Gabriela Mattos on 29/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var profile: Profile?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfile()
        nameTextField.text = profile?.name
        ageTextField.text = profile?.age
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let isOldUser = UserDefaults.standard.bool(forKey: "isOldUser")
        
        if !isOldUser {
            UserDefaults.standard.set(true, forKey: "isOldUser")
            
            let alert = UIAlertController(title: "Olá", message: "Boas vindas!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func filePath() -> URL {
        return documentsDirectory().appendingPathComponent("Profile.plist")
    }
    
    @IBAction func saveProfile() {
        let enconder = PropertyListEncoder()
        
        do {
            profile = Profile(name: nameTextField.text, age: ageTextField.text)
            let encondeProfile = try enconder.encode(profile)
            try encondeProfile.write(to: filePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error enconding profile")
        }
    }
    
    func loadProfile() {
        let path = filePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                profile = try decoder.decode(Profile.self, from: data)
            } catch {
                print("Error decoding profile")
            }
        }
    }

}

