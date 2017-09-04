//
//  ViewController.swift
//  PhotoAccessDemo
//
//  Created by Sharad Paghadal on 13/12/16.
//  Copyright © 2016 temp. All rights reserved.
//

import UIKit
import Photos
import  Foundation

class AlbumModel {
    let name:String
    let count:Int
    let collection:PHAssetCollection
    init(name:String, count:Int, collection:PHAssetCollection) {
        self.name = name
        self.count = count
        self.collection = collection
    }
}
var assets : [PHAsset] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var album:[AlbumModel] = [AlbumModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum , subtype: .any , options: nil)
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
        
        for var i in (0..<smartAlbums.count){
            let assetCollection : PHAssetCollection = smartAlbums[i]
            let c : PHFetchResult = PHAsset .fetchAssets(in: assetCollection, options: options)
            c.enumerateObjects({ (object , _, _) in
                if let asset = object as? PHAsset{
                    assets.append(asset)
                }
            })
            let newAlbum = AlbumModel(name: assetCollection.localizedTitle!, count: c.count, collection:smartAlbums[i])
            self.album.append(newAlbum)
        }
        //set up fetch options, mediaType is image
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.text = album[indexPath.row].name
        cell.detailTextLabel?.text = String(album[indexPath.row].count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        secondViewController.count = self.album[indexPath.row].count
        secondViewController.asset = [assets[indexPath.row]]
        print(assets[indexPath.row])
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



