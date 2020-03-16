//
//  DetailVC.swift
//  ArtCover (UITableView & UIImage)
//
//  Created by Artem Panasenko on 16.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var trackTitle = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: trackTitle)
        titleLabel.text = trackTitle
        titleLabel.numberOfLines = 0
    }
}
