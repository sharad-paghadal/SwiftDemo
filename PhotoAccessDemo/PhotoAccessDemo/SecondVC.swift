//
//  SecondVC.swift
//  PhotoAccessDemo
//
//  Created by Sharad Paghadal on 14/12/16.
//  Copyright © 2016 temp. All rights reserved.
//

import UIKit
import Photos

class SecondVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource{
    
    var count : Int = 0
    var asset : [PHAsset] = []

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(asset)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let img : UIImageView = cell.viewWithTag(10) as! UIImageView
        img.image = getAssetThumbnail(asset: assets[indexPath.row])
        cell.backgroundColor = UIColor.black
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
