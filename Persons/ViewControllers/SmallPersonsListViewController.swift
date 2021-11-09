//
//  SmallPersonsListViewController.swift
//  Persons
//
//  Created by Михаил Зиновьев on 09.11.2021.
//

import UIKit

class SmallPersonsListViewController: UITableViewController {
    
    private var personList: [Person]?
    private let dataManager = DataManager()
    private let personCount = 4

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personList = dataManager.getPersonList(with: personCount)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personViewController = segue.destination as? PersonViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let selectedPerson =  personList?[indexPath.row] else { return }
        
        personViewController.person = selectedPerson
    }

    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList?.count ?? .zero
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shortPersonCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let person = personList?[indexPath.row]
        
        content.text = "\(person?.name ?? .empty) \(person?.secondName ?? .empty)"
        
        cell.contentConfiguration = content
        return cell
    }
}
