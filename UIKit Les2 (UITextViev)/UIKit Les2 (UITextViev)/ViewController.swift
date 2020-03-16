//
//  ViewController.swift
//  UIKit Les2 (UITextViev)
//
//  Created by Artem Panasenko on 16.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottomConstr: NSLayoutConstraint!
    @IBOutlet weak var stepper: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    Что бы изменить фон текстового поля во время активации редактирования нужно назначит наш
        //    класс делегатом свойста textView и подписаться под протокол UITextViewDelegate
        textView.delegate = self
        
//        textView.text = ""
        
        //Меняем шрифт
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        // BoprderRadius
        textView.layer.cornerRadius = 10
        
//        stepper.value = 17
//        stepper.minimumValue = 10
//        stepper.maximumValue = 25
        
        stepper.tintColor = .white // цвета кнопок
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 5
        
        // Делаем двух наблюдателей (addObserver) которые будут следить за появлением и скрыванием клавы
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func updateTextView(notification: Notification) {
        
        guard let userInfo = notification.userInfo as? [String: AnyObject], // Вытаскиваем userInfo (где есть инфа про размер клавы)
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue // Присваиваем размер клавиатуры
            else {return}

        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero // Обнуляем ратояние между текстом и низом когда скрылась клава
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - bottomConstr.constant, // bottom: keyboardFrame.height - добавляем снизу растояние
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }

    //Скрываем клавиатуту по тапу вне поля
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        // Выбираем один из методов
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Метод view.endEditing(true) Позволяет скрыть клавиатуру любого обьекта
        self.view.endEditing(true)
        // Метод vtextView.resignFirstResponder()  скрывает клавиатуру вызваную для конкретного textView
        //textView.resignFirstResponder()
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    }
    @IBAction func sizeFont(_ sender: UIStepper) {
        
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value) // приводим к CGFloat
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
}

extension ViewController: UITextViewDelegate {
    
    // Метод когда клавиатура появилась
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    // Метод когда клавиатура скрывается
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    // shouldChangeTextIn range: NSRange -  Позволяет вводить определенное количество символов
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\( textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 60 // range.length - количество стертых символов
    }
}
