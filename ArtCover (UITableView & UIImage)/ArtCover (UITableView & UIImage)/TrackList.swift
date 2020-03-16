//
//  TrackList.swift
//  ArtCover (UITableView & UIImage)
//
//  Created by Artem Panasenko on 16.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

class TrackList: UITableViewController {

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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // задает количество строк
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

    // MARK: - Navigation

    // Передача данных по сигвею
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow { // indexPath присваиваем индекс выбраной строки
                let detailsVC = segue.destination as! DetailVC //создаем екземпляр класса DetailVC
                detailsVC.trackTitle = imageNameArray[indexPath.row] // обращаемся к свойству екземпляра и присваиваем имя
            }
            
        }
    }

}
