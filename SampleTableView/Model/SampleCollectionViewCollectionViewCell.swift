//
//  SampleCollectionViewCollectionViewCell.swift
//  SampleTableView
//
//  Created by TAKUMA NAKAMURA on 2020/01/12.
//  Copyright © 2020 NakamuraTakuma. All rights reserved.
//

import UIKit

class SampleCollectionViewCollectionViewCell: UICollectionViewCell {

    @IBOutlet var label : UILabel!
    @IBOutlet var imageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         // cellの枠の太さ
        
               self.layer.borderWidth = 1.0
               // cellの枠の色
               self.layer.borderColor = UIColor.black.cgColor
               // cellを丸くする
               self.layer.cornerRadius = 8.0
    }

}
