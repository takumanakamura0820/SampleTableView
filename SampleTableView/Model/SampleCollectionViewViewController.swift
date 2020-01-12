//
//  SampleCollectionViewViewController.swift
//  SampleTableView
//
//  Created by TAKUMA NAKAMURA on 2020/01/12.
//  Copyright © 2020 NakamuraTakuma. All rights reserved.
//

import UIKit

class SampleCollectionViewViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    var num:Int!
    
    var sampleList = ["kakedasu_takuhai1.png","manner_door_open_ashi.png","nininsankyaku_men.png"]
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SampleCollectionViewCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        
//        if let cell = cell as? CustomCell {
//            cell.setupCell(model: models[indexPath.row])
//        }

        return cell
    }
    
    
}
