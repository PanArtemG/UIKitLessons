//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Artem Panasenko on 14.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var uiElements = [  "UISegmentedControl",
                        "UILabel",
                        "UISlider",
                        "UITextField",
                        "UIButton",
                        "UIDatePicker",]
    
    var selectedElement: String?

    @IBOutlet weak var segmenedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePiker: UIDatePicker!
    @IBOutlet weak var switchLabel: UILabel!
    
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
        
        choiceElement()
        
        createToolbar()
    }
    
    // Скрыть все елементы
    func hideAllElements() {
        segmenedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        doneButton.isHidden = true
        datePiker.isHidden = true
        
    }
    
    // Создаем UIPickerView
    func choiceElement() {
        let elementPicker = UIPickerView()
        
        // delegate - для пользования после чего подписываемся к протоколу внизу через extension
        elementPicker.delegate = self
        
        textField.inputView = elementPicker
        
        //Делаем кастомизацию
        elementPicker.backgroundColor = .brown
        
    }
    
    // Создаем екзкмпляр класса UIToolbar
    func createToolbar() {
        let toolbar = UIToolbar()
        // по размеру view
        toolbar.sizeToFit()
        // создаем doneButton
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        // setItems - размещаем кнопку (можно и несколько обьектов в масииве)
        toolbar.setItems([doneButton], animated: true)
        
        // разрешаем взаимодействи епользователя
        toolbar.isUserInteractionEnabled = true
        
        //при тапе наtextField мы встраиваем тулбар над клавиатурой
        textField.inputAccessoryView = toolbar
        
        //Делаем кастомизацию tintColor - text color
        toolbar.tintColor = .white
        
        //цвет заливки
        toolbar.barTintColor = .brown
    }
    
    // @objc - для того что мог использовать селектор екшена // скрываем клаву
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        segmenedControl.isHidden = !segmenedControl.isHidden
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        doneButton.isHidden = !doneButton.isHidden
        datePiker.isHidden = !datePiker.isHidden
        
        if sender.isOn {
            switchLabel.text = "Hide all elements"
        } else {
            switchLabel.text = "Show all elements"
        }
    }
    
    
    
}

extension ViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    // количество барабанов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // количество доступных елементов в UIPickerView (задаем количество длинной массива)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    // Отбражает тайтл для каждого ров
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    // Позволяет работать с выбраным елементом
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,  inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        
        switch row {
            case 0:
                hideAllElements()
                segmenedControl.isHidden = false
            case 1:
                hideAllElements()
                label.isHidden = false
            case 2:
                hideAllElements()
                slider.isHidden = false
            case 3:
                hideAllElements()
            case 4:
                hideAllElements()
                doneButton.isHidden = false
            case 5:
                hideAllElements()
                datePiker.isHidden = false
            default:
                hideAllElements()
        }
    }
    
    // Функция позволяет работать со свойствами лайблев в pickerView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
    
}
