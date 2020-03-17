//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Artem Panasenko on 17.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObserver()
        tapObserver()
    }

    //  Слушатель свайпов
    func swipesObserver() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:  #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action:  #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action:  #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    // Слушатель тапов
    func tapObserver() {
        
        let triplTap = UITapGestureRecognizer(target: self, action: #selector(triplTapAction))
        triplTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(triplTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: triplTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func triplTapAction() {
        label.text = "TRIPL"
        
    }
    
    @objc func doubleTapAction() {
        label.text = "DOUBLE"
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
            label.text = "Right"
        case .left:
            label.text = "Left"
        case .up:
            label.text = "Up"
        case .down:
            label.text = "Down"
        default:
            break
        }
        
    }
}

