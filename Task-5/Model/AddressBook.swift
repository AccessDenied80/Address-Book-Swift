//
//  AddressBook.swift
//  Task-5
//
//  Created by Gluschenko Andrey on 23.03.2020.
//  Copyright © 2020 Gluschenko Andrey. All rights reserved.
//
import Foundation
import UIKit

struct Contact {
    var firstName: String
    var lastName: String
    var phone: String
    var country: String
    var city: String
    var group: String
    var photo: UIImage?
}

class AddressBook {
    
    var contacts: [Contact] = []
    
    init() {
        
        contacts = [
            Contact(firstName: "Arnold", lastName: "Schwarzenegger", phone: "+38 055 555-55-55", country: "USA", city: "", group: "Frends"),
            Contact(firstName: "Greta", lastName: "Berry", phone: "+38 342 555-34-55", country: "", city: "New York", group: "Work"),
            Contact(firstName: "Alfred", lastName: "McCoy", phone: "+38 055 466-55-23", country: "USA", city: "New York", group: "Frends"),
            Contact(firstName: "Denis", lastName: "Caribidis", phone: "+38 032 324-55-52", country: "USA", city: "Santa Fe", group: "Work"),
            Contact(firstName: "Valen", lastName: "Kudrey", phone: "+38 055 234-55-87", country: "USA", city: "California", group: "Frends"),
            Contact(firstName: "Jhon", lastName: "Ballet", phone: "+38 055 555-55-55", country: "Ukraine", city: "Zhitomir", group: "Frends"),
            Contact(firstName: "Viktor", lastName: "Tsoj", phone: "+38 055 234-55-55", country: "USA", city: "California", group: "Frends"),
            Contact(firstName: "Mark", lastName: "Zaharov", phone: "+38 055 555-55-55", country: "India", city: "", group: "Work"),
            Contact(firstName: "Zelta", lastName: "Martin", phone: "+38 055 875-55-55", country: "USA", city: "California", group: "Frends"),
            Contact(firstName: "Rodrigo", lastName: "Lopez", phone: "+38 055 246-55-55", country: "USA", city: "Jersy", group: "Frends"),
            Contact(firstName: "Orlando", lastName: "Blum", phone: "+38 023 555-43-55", country: "Brazil", city: "Alta", group: "Frends"),
        ]
        sort()
    }

    func contact(_ indexPath: IndexPath) -> Contact? {
        return contacts[indexPath.row]
    }
         
    func countSections() -> Int {
        return 1
    }

    func countPersonInSection(_ section: Int) -> Int {
        return contacts.count
    }
    
    func remove(_ indexPath: IndexPath) {
        contacts.remove(at: indexPath.row)
    }
    
    func edit(contact: Contact, atIndex: IndexPath) {
        contacts[atIndex.item] = contact
        sort()
    }
    
    func add(contact: Contact) {
        contacts.append(contact)
        sort()
    }
    
    func sort() {
        contacts.sort{$0.lastName < $1.lastName}
    }
}
