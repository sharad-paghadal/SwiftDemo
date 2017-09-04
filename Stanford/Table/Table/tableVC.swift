//
//  tableVC.swift
//  Table
//
//  Created by Sharad Paghadal on 21/02/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class tableVC: UITableViewController {
    
    var device : NSMutableArray = ["iPhone 7", "iPhone 7 plus", "Zenfone 2", "Zenfone 3" ,"Galaxy S8"]
    var manufacture : NSMutableArray = ["Apple", "Apple", "Asus", "Asus", "Samsung"]
    
    @IBAction func addBtnClicked(_ sender: UIBarButtonItem) {
    
        device.add("temp \(device.count+1)")
        manufacture.add("temp \(manufacture.count+1)")
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return device.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let viewCell = cell as? cellTableViewCell {
            viewCell.osNameLbl.text = device[indexPath.row] as? String
            viewCell.founderName = manufacture[indexPath.row] as? String
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            device.removeObject(at: indexPath.row)
            manufacture.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
