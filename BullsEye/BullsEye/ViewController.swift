//
//  ViewController.swift
//  BullsEye
//
//  Created by Gabriela Mattos on 26/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var gameSlider: UISlider!
    @IBOutlet weak var numberRandomLabel: UILabel!
    @IBOutlet weak var amountRoundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var sliderCurrentValue: Int = 0
    var targetValue: Int = 0
    var rounds = 0
    var totalScore: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLookInSlider()
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func addLookInSlider() {
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        gameSlider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        gameSlider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        gameSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        gameSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let roundScore = calculateStore()
        totalScore = totalScore + roundScore
        let message = "The value of the slider is: \(sliderCurrentValue)" +
        "\nThe target value is: \(targetValue).\nTotal score is: \(roundScore)"
        let alert = UIAlertController(title: "Hello Word!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: { action in
                self.startNewRound()
        }) // -> Closure
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        sliderCurrentValue = lroundf(gameSlider.value)
        print("The value is \(sliderCurrentValue)")
    }
    
    @IBAction func startOverButtonAction(_ sender: Any) {
        startNewGame()
    }
    
    func startNewGame() {
        rounds = 0
        totalScore = 0
        startNewRound()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        view.layer.add(transition, forKey: nil)
    }
    
    func getNumberRandom() -> Int {
        // arc4random -> gera número de 0 a 99.
        return 1 + Int(arc4random_uniform(100))
    }
    
    func startNewRound() {
        rounds = rounds + 1
        targetValue = getNumberRandom()
        sliderCurrentValue = 50
        updateFieldsUI()
    }
    
    func updateFieldsUI() {
        numberRandomLabel.text = String(targetValue)
        amountRoundLabel.text = String(rounds)
        gameSlider.value = Float(sliderCurrentValue)
        scoreLabel.text = String(totalScore)
    }
    
    func calculateStore() -> Int {
        let score = abs(targetValue - sliderCurrentValue)
        
        return 100 - score
    }
    
}

