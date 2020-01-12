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
    
    var sampleList = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]
    var imageList = [UIImage (named: "kakedasu_takuhai1.png"),UIImage (named: "manner_door_open_ashi.png"),UIImage (named: "job_suugakusya_woman.png")]
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "SampleCollectionViewCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SampleCollectionViewCollectionViewCell
        cell.label.text = sampleList[indexPath.row]
        cell.imageView.image = imageList[indexPath.row]
        
        return cell
    }
    
    
    
    
    
}
