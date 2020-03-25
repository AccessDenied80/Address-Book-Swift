//
//  DetailController.swift
//  Task-5
//
//  Created by Gluschenko Andrey on 23.03.2020.
//  Copyright © 2020 Gluschenko Andrey. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    var addressBook: AddressBook? = nil
    var contact: Contact? = nil
    let notDefineText = "не указано"

    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var country: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if contact != nil {
            name.text = contact!.lastName + " " + contact!.firstName
            phone.text = contact!.phone
            if !contact!.group.isEmpty {
                group.text = contact!.group
            } else {
                group.text = notDefineText
            }
            
            if !contact!.country.isEmpty {
                country.text = contact!.country
            } else {
                country.text = notDefineText
            }
            
            if !contact!.city.isEmpty {
                city.text = contact!.city
            } else {
                city.text = notDefineText
            }
            
        }
    }

}
