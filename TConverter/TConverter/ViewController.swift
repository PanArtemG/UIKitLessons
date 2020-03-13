//
//  ViewController.swift
//  TConverter
//
//  Created by Artem Panasenko on 13.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrengeitLabel: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
        }
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print ("Slider value chang")
        let temparuteCelsius = Int(round(sender.value))
        celsiusLabel.text = "\(temparuteCelsius)ºC"
        
        let temperatureFahrengeit = Int(round(sender.value * 9 / 5) + 32)
        
        fahrengeitLabel.text = "\(temperatureFahrengeit)ºF"
        
    }
    
}

