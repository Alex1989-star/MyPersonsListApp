//
//  DetailViewController.swift
//  PersonsList
//
//  Created by Леся on 09.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person = Person(firstName: "firstName", lastName: "lastName", phoneNumber: "phoneNumber", email: "email")
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = person.fullName
        phoneLabel.text = person.phoneNumber
        emailLabel.text = person.email
        
        
    }
}
