//
//  CategoryCell.swift
//  withoutStoryboard
//
//  Created by Mateusz Chojnacki on 24.07.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    private let cellId = "appCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init code")
    }
    
    //MARK: Collection views
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.4612814335, green: 0.7137773642, blue: 1, alpha: 1)
        
        
        //important to constrains
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    //MARK: Collection views delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    //MARK: SetUp View
    
    func setUpViews(){
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(appsCollectionView)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: [], metrics: nil, views: ["v0": appsCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0": appsCollectionView]))
        
    }
    
}

class AppCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init code")
    }
    
    let imageView:UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "icon")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Star build by: Starts"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        
        return label
    }()
    
    func setUpViews(){
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width - 40, height: frame.width - 40)
        nameLabel.frame = CGRect(x: 0, y: imageView.frame.maxY, width: frame.width, height: 20)
        categoryLabel.frame = CGRect(x: 0, y: imageView.frame.maxY + 20, width: frame.width, height: 20)
    }
}
