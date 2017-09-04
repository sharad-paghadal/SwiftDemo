//
//  TableViewCell.swift
//  CollectionTableViewDemo
//
//  Created by Sharad Paghadal on 23/12/16.
//  Copyright © 2016 temp. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
}

extension TableViewCell{
    
    func setCollectionViewDataSourceDelegate <D: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: D, forRow row: Int ){
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false)
        collectionView.reloadData()
    }
    
    var collectionViewOffset : CGFloat {
        get{
            return collectionView.contentOffset.x
        }
        set{
            collectionView.contentOffset.x = newValue
        }
    }
}


