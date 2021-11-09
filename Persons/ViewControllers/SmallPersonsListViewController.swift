//
//  SmallPersonsListViewController.swift
//  Persons
//
//  Created by Михаил Зиновьев on 09.11.2021.
//

import UIKit

class SmallPersonsListViewController: UITableViewController {
    
    private var personList = Person.getPersonList()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shortPersonCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = personList[indexPath.row]
        
        content.text = "\(person.name) \(person.secondName)"
        cell.contentConfiguration = content
        return cell
    }
}
