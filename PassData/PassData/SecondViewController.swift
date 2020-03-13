//
//  SecondViewControlerViewController.swift
//  PassData
//
//  Created by Artem Panasenko on 13.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    // ! гарантирует что пока мы начнем использовать данную переменную она будет со значением
    var login: String!

    @IBOutlet weak var label: UILabel!
    
    @IBAction func sendPressed(button: UIButton){
        performSegue(withIdentifier: "unwindSegue", sender: nil )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let login = login else {return}
        label.text = "Hello, \(login)"
    }

}
