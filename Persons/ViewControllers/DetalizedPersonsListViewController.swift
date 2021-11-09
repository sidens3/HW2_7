//
//  DetalizedPersonsListViewController.swift
//  Persons
//
//  Created by Михаил Зиновьев on 09.11.2021.
//

import UIKit

class DetalizedPersonsListViewController: UITableViewController {
    
    private var personList: [Person]?
    private let dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        personList = dataManager.getPersonList()
    }

    //MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return personList?.count ?? .zero
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detalizedPersonCell", for: indexPath)
    
        cell.contentConfiguration = getConfigured(content: cell.defaultContentConfiguration(), by: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let person = personList?[section] else { return .empty }
        return "\(person.name) \(person.secondName)"
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .clear
        headerView.textLabel?.textColor = .systemGray
    }
    
    //MARK: - Private Methods
    private func getConfigured(content: UIListContentConfiguration, by indexPath: IndexPath) -> UIListContentConfiguration {
        guard let person = personList?[indexPath.section] else { return content }
        var content = content
        
        switch indexPath.row {
        case 0:
            content.image = UIImage(systemName: "phone")
            content.text = String(person.phoneNumber)
        default:
            content.image = UIImage(systemName: "tray")
            content.text = person.email
        }
        return content
    }
}
