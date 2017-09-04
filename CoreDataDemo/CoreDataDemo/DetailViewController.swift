//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by Sharad Paghadal on 26/10/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var nameText: UITextField!{
        didSet{
            nameText.delegate = self
        }
    }
    var people = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBtnClicked(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity =  NSEntityDescription.entity(forEntityName: "Person", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        transc.setValue(nameText.text, forKey: "name")
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
