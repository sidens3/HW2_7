//
//  PersonViewController.swift
//  Persons
//
//  Created by Михаил Зиновьев on 09.11.2021.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        guard let person = self.person else { return }
        
        navigationItem.title = "\(person.name) \(person.secondName)"
        
        phoneLabel.text = "Phone: \(person.phoneNumber)"
        emailLabel.text = "Email: \(person.email)"
    }
}
