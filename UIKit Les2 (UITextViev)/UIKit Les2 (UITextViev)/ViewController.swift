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
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    Что бы изменить фон текстового поля во время активации редактирования нужно назначит наш
        //    класс делегатом свойста textView и подписаться под протокол UITextViewDelegate
        textView.delegate = self
        
//        textView.text = ""
        
        textView.isHidden = true
//        для крутилки
//        textView.alpha = 0
        
        //Меняем шрифт
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        // BoprderRadius
        textView.layer.cornerRadius = 10
        
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        
        stepper.tintColor = .white // цвета кнопок
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 8
        
        // По окончанию активности пропадает
        activityIndic.hidesWhenStopped = true
        activityIndic.color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        activityIndic.startAnimating()
        
        progressView.setProgress(0, animated: true)
        
        // Запрещает взаимодействе пользователя с app пока индикатор активен
        self.view.isUserInteractionEnabled = false
        
        // Делаем двух наблюдателей (addObserver) которые будут следить за появлением и скрыванием клавы
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        
        // !!!!!!!  АНИМАЦИЯ !!!!!!!!
        
        // Для крутилки!!!
        // withDuration - продолжительность
        // delay - задержка
        // options - выбираем анимацию
        // animations - что анимируем
//        UIView.animate(withDuration: 0, delay: 5, options: .curveEaseIn, animations: {
//            self.textView.alpha = 1
//        }) { (finised) in
//            self.activityIndic.stopAnimating()
//            self.textView.isHidden = false
//            self.view.isUserInteractionEnabled = true // отменяем отключенее взаимодействие
//        }
        
        // Для прогресс
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.progress += 0.2
            } else {
                self.activityIndic.stopAnimating()
                self.textView.isHidden = false
                self.view.isUserInteractionEnabled = true // отменяем отключенее взаимодействие
                self.progressView.isHidden = true
            }
        }
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
