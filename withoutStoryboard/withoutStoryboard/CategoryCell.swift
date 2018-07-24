//
//  CategoryCell.swift
//  withoutStoryboard
//
//  Created by Mateusz Chojnacki on 24.07.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init code")
    }
    
    
    func setUpViews(){
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
}
