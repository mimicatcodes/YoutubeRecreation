//
//  MenuBar.swift
//  YoutubeRecreation
//
//  Created by Luna An on 12/29/16.
//  Copyright © 2016 Mimicatcodes. All rights reserved.
//

import Foundation
import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(r: 230, g: 32, b: 31)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["icon4", "icon1", "icon2", "icon3"]
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        // Register Cell Class
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        // preselect menu item
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .bottom)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named:imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(r: 91, g: 14, b: 13)
        return cell
    }
    
    // Equal sizing for cell items in collectionView
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    // Reduce spacing between cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell {
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon1")?.withRenderingMode(.alwaysTemplate)
        return imageView
    }()
    
    override var isHighlighted: Bool{
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(r: 91, g: 14, b: 13)
        }
    }
    
    override var isSelected: Bool{
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(r: 91, g: 14, b: 13)
        }
    }
    
    
    override func setupViews(){
        super.setupViews()
        
        addSubview(imageView)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)

        // Position constraints for menu bar items
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
   
}
