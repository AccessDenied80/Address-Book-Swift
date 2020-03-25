//
//  EditController.swift
//  Task-5
//
//  Created by Gluschenko Andrey on 23.03.2020.
//  Copyright © 2020 Gluschenko Andrey. All rights reserved.
//

import UIKit

class EditController: UIViewController {

    var contact: Contact? = nil
    var addressBook: AddressBook? = nil
    var index: IndexPath? = nil
    var isNew: Bool = true
        
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var group: UITextField!
    
    @IBOutlet weak var storeButton: UIButton!
    
    @IBAction func storeAction(_ sender: UIButton) {
        if phone.text!.isEmpty || lastName.text!.isEmpty || firstName.text!.isEmpty {
            let alert = UIAlertController(title: "Внимание", message: "Заполните обязательные поля", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Понятно", comment: ""), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if isNew {
            contact = Contact(
                firstName: firstName.text!,
                lastName: lastName.text!,
                phone: phone.text!,
                country: country.text!,
                city: city.text!,
                group: group.text!,
                photo: nil)
            addressBook!.add(contact: contact!)
            navigationController?.popViewController(animated: true)
            return
        }
    
        contact!.firstName = firstName.text!
        contact!.lastName = lastName.text!
        contact!.phone = phone.text!
        contact!.country = country.text!
        contact!.city = city.text!
        contact!.group = group.text!
        addressBook!.edit(contact: contact!, atIndex: index!)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        storeButton.layer.cornerRadius = 8
        if contact != nil {
            self.title = "Редактирование контакта"
            phone.text = contact!.phone
            firstName.text = contact!.firstName
            lastName.text = contact!.lastName
            country.text = contact!.country
            city.text = contact!.city
            group.text = contact!.group
            isNew = false
        } else {
            self.title = "Новый контакт"
        }
    }
    
}
