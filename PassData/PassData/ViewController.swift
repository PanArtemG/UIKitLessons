//
//  ViewController.swift
//  PassData
//
//  Created by Artem Panasenko on 13.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var returnLabel: UILabel!
    
    @IBAction func sendPressed(sender: UIButton) {
        // ВТОРОЙ МЕТОД Передаем от view на view если не привязываем к кнопке
        performSegue(withIdentifier: "detailSigua", sender: nil)
        
    }
    
    // екшен для возврата на главное VC
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) {
        // Проверяем ID
        guard segue.identifier == "unwindSegue" else { return }
        //Получаем данные обратно
        guard let svc = segue.source as? SecondViewController else {return}
        self.returnLabel.text = svc.label.text
    }
    
    // метод prepare срабатыевает при segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Передаем данные в другой VC через кнопку
        guard let dvc = segue.destination as? SecondViewController else { return }
        // передаем логин в dvc.login который находится на SecondViewController
        dvc.login = loginTextField.text
    }
    // прячем клавиатуру
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}

