//
//  ViewController.swift
//  ContactAppDemo
//
//  Created by Sharad Paghadal on 13/12/16.
//  Copyright © 2016 temp. All rights reserved.
//

import UIKit
import ContactsUI
import Contacts

class ViewController: UIViewController, CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func insertContactBtnClicked(_ sender: AnyObject) {
        let contact = CNMutableContact()
        
        //contact.imageData = NSData() // The profile picture as a NSData object
        
        contact.givenName = "John"
        contact.familyName = "Appleseed"
        
        //        let homeEmail = CNLabeledValue(label:CNLabelHome, value:"john@example.com")
        //        let workEmail = CNLabeledValue(label:CNLabelWork, value:"j.appleseed@icloud.com")
        //        contact.emailAddresses = [homeEmail, workEmail]
        
        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:"(408) 555-0126"))]
        
        let homeAddress = CNMutablePostalAddress()
        homeAddress.street = "1 Infinite Loop"
        homeAddress.city = "Cupertino"
        homeAddress.state = "CA"
        homeAddress.postalCode = "95014"
        contact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]
        
        let birthday = NSDateComponents()
        birthday.day = 1
        birthday.month = 4
        birthday.year = 1988  // You can omit the year value for a yearless birthday
        contact.birthday = birthday as DateComponents
        
        // Saving the newly created contact
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        try! store.execute(saveRequest)
        
        let alert :UIAlertController = UIAlertController(title: "Details", message: "Contact added" , preferredStyle:.actionSheet)
        let ok : UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func SelectbtnClicked(_ sender: AnyObject) {
        let contact = CNContactPickerViewController()
        contact.delegate = self
        self.present(contact, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach{ contact in
            for number in contact.phoneNumbers{
                let phoneNumber = number.value as CNPhoneNumber
                print("Phone Number :- \(phoneNumber) Name : \(contact.givenName)")
            }
        }
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel contact picker")
    }

}

