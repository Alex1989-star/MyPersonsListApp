//
//  PersonsDetailTableViewController.swift
//  PersonsList
//
//  Created by Леся on 09.06.2021.
//

import UIKit

class PersonsDetailTableViewController: UITableViewController {
    
    var persons = DataManager.getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = persons[indexPath.section].phoneNumber
            cell.imageView?.image = UIImage(systemName: "iphone", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        case 1:
            cell.textLabel?.text = persons[indexPath.section].email
            cell.imageView?.image = UIImage(systemName: "mail", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return persons[section].fullName
    }
}
