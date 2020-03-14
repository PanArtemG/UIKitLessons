//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Artem Panasenko on 14.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmenedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmenedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
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
    
}

