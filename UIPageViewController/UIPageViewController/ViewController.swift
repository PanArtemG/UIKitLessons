//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Artem Panasenko on 17.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Жизненный цикл viewDidAppear  срабатывает сразу как VIEW отобразился на екране 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }
    //Создает екземпляр класса PageViewController
    func startPresentation() {
        // Создаем проверку на ключ просмотра
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(
                identifier: "PageViewController") as? PageViewController {
                //Запускаем презентацию
                present(pageViewController, animated: true, completion: nil)
            }
        }
    }
}

