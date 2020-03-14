//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Artem Panasenko on 14.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmenedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePiker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
        
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmenedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .white
        
        datePiker.locale = Locale(identifier: "ru_RU")
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        switch segmenedControl.selectedSegmentIndex {
        case 0:
            label.text = "Selected 1"
            label.textColor = .red
        case 1:
            label.text = "Selected 2"
            label.textColor = .blue
        case 2:
            label.text = "Selected 3"
            label.textColor = .yellow
        default:
            print("ERROR!!!")
        
        }
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        
        label.text = String(sender.value)
        
        let bgc = self.view.backgroundColor
        // withAlphaComponent(CGFloat(sender.value)) - свойство прозрачности фона екрана
        self.view.backgroundColor = bgc?.withAlphaComponent(CGFloat(sender.value))
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else {return}
        
        if let _ = Double(textField.text!) {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            // present - вызывает на екран предупреждение
            present(alert, animated: true, completion: nil)
            
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        //  конст будет отображать формат даты
        let dateFormatter = DateFormatter()
        // настроиваем формат даты (полная)
        dateFormatter.dateStyle = .full
        // Переводим в формат RU
        dateFormatter.locale = Locale(identifier: "ru_RU")
        // значение присваиваем другой константе в строковом формате
        let dateValue = dateFormatter.string(from: sender.date)
        
        label.text = dateValue
    }
    
    
}

