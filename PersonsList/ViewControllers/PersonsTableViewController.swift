//
//  ViewController.swift
//  PersonsList
//
//  Created by Леся on 09.06.2021.
//

import UIKit

class PersonsTableViewController: UITableViewController, UITextFieldDelegate {
    
    var persons = DataManager.getPersons()
    
    lazy var searchBar = UISearchBar(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        let addSettings = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(toAdd))
        navigationItem.rightBarButtonItem = addSettings
        
    }
    @objc func toAdd() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        }

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        
            persons.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        cell.textLabel?.text = persons[indexPath.row].fullName
        cell.imageView?.image = UIImage(systemName: "phone")

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "detailSegue" else {return}
        
        let indexPath = tableView.indexPathForSelectedRow
        let navigationVC = segue.destination as? UINavigationController
        let detailPersonVC = navigationVC?.topViewController as? DetailViewController
        detailPersonVC?.person = persons[indexPath?.row ?? 0]
    }
    
    @IBAction func unwindSeque(seque: UIStoryboardSegue) {
    }
}

