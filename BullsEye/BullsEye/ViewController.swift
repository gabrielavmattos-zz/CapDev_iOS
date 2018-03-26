//
//  ViewController.swift
//  BullsEye
//
//  Created by Gabriela Mattos on 26/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderGame: UISlider!
    @IBOutlet weak var numberRandomLabel: UILabel!
    var sliderCurrentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCurrentValue = lroundf(sliderGame.value)
        targetValue = getNumberRandom();
        
        numberRandomLabel.text = "\(targetValue)";
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let message = "The value of the slider is: \(sliderCurrentValue)" +
        "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello Word!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        sliderCurrentValue = lroundf(sliderGame.value)
        print("The value is \(sliderCurrentValue)")
    }
    
    func getNumberRandom() -> Int {
        return 1 + Int(arc4random_uniform(100))
    }
    
    func startNewRound () {
        targetValue = getNumberRandom()
        sliderCurrentValue = 50
        sliderGame.value = Float(sliderCurrentValue)
    }
}

