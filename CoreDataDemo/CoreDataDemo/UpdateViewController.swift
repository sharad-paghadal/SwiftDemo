//
//  UpdateViewController.swift
//  CoreDataDemo
//
//  Created by Sharad Paghadal on 26/10/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

import UIKit
import CoreData

class UpdateViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    var tempValue : Int = 0
    var people = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        updatefn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updatefn(){
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchrequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Person")
        do {
            let results = try managedContext.fetch(fetchrequest)
            people = results as! [NSManagedObject]
            nameText.text = people[tempValue].value(forKey: "name") as? String
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func updateBtnClicked(_ sender: AnyObject) {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchrequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Person")
        do {
            let results = try managedContext.fetch(fetchrequest)
            let managedObject = results[tempValue] as! NSManagedObject
            managedObject.setValue(nameText.text, forKey: "name")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        do {
            try managedContext.save()
            print("Updated!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
        }
    }
}
