//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    let soft_time: Int = 5
//    let med_time: Int = 7
//    let hard_time: Int = 12
    
    var timer = Timer()
    var current_progress : Float = 0.0
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]

    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton){
        
        timer.invalidate()
        
        secondsPassed = 0
        current_progress = 0.0
        
        let hardness = sender.currentTitle!
        
        titleLabel.text = "Cooking \(hardness) egg!"
        progressBarView.progress = current_progress
        
//        switch(hardness){
//        case "Soft": // can also do 1...4
//            print(soft_time)
//        case "Medium":
//            print(med_time)
//        case "Hard":
//            print(hard_time)
//        default:
//            print("Error")
//        }
        
//        print(eggTimes[hardness]!)//we make sure it spell correctly. Dictionary[Key] is optional and can return nil if not exact same Soft != soft
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        //example functionality
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            current_progress = Float(secondsPassed)/Float(totalTime)
            
            print(current_progress)
            
            progressBarView.progress = current_progress
            
            if secondsPassed == totalTime {
                
                titleLabel.text = "DONE"
                
                playSound()
                
            }
            
        }
    
    }
    
    func playSound() {
        
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
        
//        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            /* iOS 10 and earlier require the following line:
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
//
//            guard let player = player else { return }
//
//            player.play()
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
        
    }
    
}
