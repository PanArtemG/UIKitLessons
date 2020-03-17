//
//  DetailViewController.swift
//  ArtCover (UIConteinerView)
//
//  Created by Artem Panasenko on 17.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    let imageNameArray = [
        "Tiësto @ EDC - Mexico",
        "HOSH @ Jai - Vilas Palace for Cercle",
        "Armin van Buuren @ EDC - Mexico 2020",
        "Timmy Trumpet & W&W @ EDC - Mexico 2020",
        "A State Of Trance (ASOT) 950 - Part 1",
        "A State Of Trance (ASOT) 950 - Part 2",
        "lubLife By Tiësto - 669",
        "A Trance (ASOT) 950 - Part 1",
        "A Trance (ASOT) 950 - Part 2",
        "David Guetta Playlist - 496"
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    // Метод numberOfRowsInSection - задает/возвращает количество строк
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    // Задаем индинтефикатор нашего основного storyboard - withIdentifier: "Title"
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        // задаем содержимое ячейки

        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row] ) // картинка ячейки
        cell.textLabel?.text = imageNameArray[indexPath.row] // тайтл ячейки
        cell.textLabel?.numberOfLines = 0 // количество строк для переноса АВТО
        return cell
    }
    
    // изменить высоту ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // didSelectRowAt - позволяет фиксировать строчку которую выделяем
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // инициализируем ViewController и передаем данные
        if let viewControler = parent as? ViewController {
            
            let trackTitle = imageNameArray[indexPath.row]
            viewControler.titleLabel.text = trackTitle
            viewControler.imageCover.image = UIImage(named: trackTitle)
        }
    }


}
