//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Sharad Paghadal on 26/10/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var people = [NSManagedObject]()
    var firstAtempt = true
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tempfn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let person = people[indexPath.row]
        cell!.textLabel!.text = person.value(forKey: "name") as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let updateViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        updateViewController.tempValue = indexPath.row
        self.navigationController?.pushViewController(updateViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            managedContext.delete(people[indexPath.row] as NSManagedObject)
            people.remove(at: indexPath.row)
            do {
                try managedContext.save()
                print("deleted!")
            } catch {
                print("Some Error")
            }
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    @IBAction func addClicked(_ sender: AnyObject) {
    }
    
    func tempfn() {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchrequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Person")
        do {
            let results = try managedContext.fetch(fetchrequest)
            people = results as! [NSManagedObject]
            print("Record Fetched!")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !firstAtempt{
            tempfn()
        }
        firstAtempt = false
    }
}

