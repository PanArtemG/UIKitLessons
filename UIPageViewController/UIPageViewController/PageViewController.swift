//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by Artem Panasenko on 17.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let pressentScreenContent =
        [
        "Первая страница презентации рассказыает о том, что наше АПП из себя представляет",
        "Вторая страница презентации рассказыает о том, какие есть классные фичи",
        "Третья страница презентации так же рассказыает о том, что то интересное",
        "Ну и четвертая страница говорит ПОКА!!!!",
        ""
        ]
    
    let emojiArray = ["😎", "🤣", "🤪", "🤬", ""]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self

        // После создания showViewControllerAtIndex(0) по индекс 0  и делаем отображение нашего VIEW
        //setViewControllers создает масив из ViewControllers
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // Создаем функцию которая создает VIEW для каждой страницы
    // (_ index: Int) - принимает индекс страницы
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil}
        
        let userDefaults = UserDefaults.standard
        // Сохраняем ключ в настройках приложения когда презентация просмотрена
        userDefaults.set(true, forKey: "presentationWasViewed")
        
        guard index < pressentScreenContent.count  else {
            // dismiss метод закрывает страницу
            dismiss(animated: true, completion: nil)
            return nil
            
        }
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController  else { return nil }
        
        contentViewController.pressentText = pressentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = pressentScreenContent.count
        
        return contentViewController
    }
}

// Для перелистыввание страниц презентации подписываемся под прокол
extension PageViewController: UIPageViewControllerDataSource {
    // viewControllerBefore - переход назад
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    // viewControllerAfter - переход вперед
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
    
}
