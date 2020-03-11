//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Artem Panasenko on 11.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!

    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func findWeekDay() {
        
        // Достаем календарь
        let calendar = Calendar.current
        
        // Создаем пустой компонент даты
        var dateComponents = DateComponents()
        
        // Инструкцией guard проверяем данные и достаем из инпутов
        guard let day = dataTF.text,
              let month = monthTF.text,
              let year = yearTF.text
            else { return }
        
        // Пушим данные в контейнер dateComponents
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        // Сново проверяем данные и преобразуим их в дату
        guard let date = calendar.date(from: dateComponents) else { return }
        
        // Задаем нужный формат вывода даты (достаем день недели)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        // Приобразуем дату в нужный строковый формат
        let weekday = dateFormatter.string(from: date)
        
        // Помещаем данные в лейбл
        resultLabel.text = weekday
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

