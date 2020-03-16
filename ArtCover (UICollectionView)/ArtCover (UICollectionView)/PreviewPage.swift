//
//  PreviewPage.swift
//  ArtCover (UICollectionView)
//
//  Created by Artem Panasenko on 16.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {
    
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

        // Register cell classes
        // При индентификации ячейки через клас эта строчка нам не нужна!!!
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //as! ArtCoverCell говорим что наша ячека это этот класс
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
    
        return cell
    }
}
