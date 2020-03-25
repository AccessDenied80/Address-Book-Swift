//
//  TableController.swift
//  Task-5
//
//  Created by Gluschenko Andrey on 23.03.2020.
//  Copyright © 2020 Gluschenko Andrey. All rights reserved.
//

import UIKit

class TableController: UITableViewController {

    let addressBook = AddressBook()
    
    @IBAction func newAction(_ sender: UIBarButtonItem) {
        let vc = EditController()
        vc.addressBook = self.addressBook
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let vc = segue.destination as? DetailController {
                    if let contact = addressBook.contact(indexPath) {
                        vc.contact = contact
                        vc.addressBook = addressBook
                    }
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return addressBook.countSections()
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressBook.countPersonInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath)
        if let contact = addressBook.contact(indexPath) {
            cell.textLabel!.text = contact.lastName + " " + contact.firstName
            cell.detailTextLabel!.text = contact.phone
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let vc = EditController()
            vc.contact = self.addressBook.contact(indexPath)
            vc.addressBook = self.addressBook
            vc.index = indexPath
            self.navigationController!.pushViewController(vc, animated: true)
        })
        editAction.backgroundColor = .blue

        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.addressBook.remove(indexPath)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        })
        deleteAction.backgroundColor = .red

        return [editAction, deleteAction]
    }
}
