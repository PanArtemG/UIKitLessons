//
//  ViewController.swift
//  OutletAndAction
//
//  Created by Artem Panasenko on 11.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    @IBAction func SayInConsole(_ sender: UIButton) {
        
        print("Hello World in console")
    }
    @IBAction func changeTextInLabel(_ sender: UIButton) {
        Label.text = "Hello World!!!"
    }
}
