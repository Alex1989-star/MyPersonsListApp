//
//  ViewController.swift
//  PersonsList
//
//  Created by Леся on 09.06.2021.
//

import UIKit

class PersonsTableViewController: UITableViewController {
    
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

    
  //Mark: Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        
            persons.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    //Mark: Move
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = persons[sourceIndexPath.row]
        persons.remove(at: sourceIndexPath.row)
        persons.insert(item, at: destinationIndexPath.row)
    }
    
    //Mark: Copy/Paste
    
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) {
            print("Copy")
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)) {
            let cell = tableView.cellForRow(at: indexPath)
            let pasteBoard = UIPasteboard.general
            pasteBoard.string = cell?.textLabel?.text
        }
    }
    
   
    // Mark: Settings tableView
    
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

