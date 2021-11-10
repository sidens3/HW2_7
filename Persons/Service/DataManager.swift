//
//  DataManager.swift
//  Persons
//
//  Created by Михаил Зиновьев on 09.11.2021.
//

import Foundation

class DataManager {
    private let nameArray = [
        "Мурзик",
        "Барсик",
        "Соня",
        "Дымка",
        "Антон",
        "Иван",
        "Даниил"
    ]
    private let secondNameArray = [
        "Иванов",
        "Петров",
        "Котейкин",
        "Котэнатор",
        "Сидоров",
        "Антонов",
        "Федоров"
    ]
    private let phoneArray = [
        19991234567,
        21234567890,
        39213333333,
        49005005050,
        51235858890,
        69212343333,
        79005005050
    ]
    private let emailArray = [
        "cat@gmail.com",
        "myrz@yandex.ru",
        "dym@mail.ru",
        "sonya@sonya.cat",
        "cators@gmail.net",
        "myrmyrmyr@yandex.ru",
        "fedorKot@mail.ru",
    ]
    
    private let personCount = 15
    private static var personsList: [Person] = []
    
    public func getPersonList() -> [Person] {
        let sharedPersonList = DataManager.personsList
        
        if sharedPersonList.count == .zero {
            return generatePersonsList(with: personCount)
        }
        return sharedPersonList
    }
    
    //MARK: - Private Methods
    private func generatePersonsList(with count: Int) -> [Person] {
        var personsList: [Person] = []
        
        for _ in (.zero..<count) {
            personsList.append(getRandomPerson())
        }
        
        personsList.sort { $0.name < $1.name }
        return personsList
    }
    
    private func getRandomPerson() -> Person {
        return Person(
            name: nameArray.randomElement() ?? .empty,
            secondName: secondNameArray.randomElement() ?? .empty,
            phoneNumber: phoneArray.randomElement() ?? 0000000000,
            email: emailArray.randomElement() ?? .empty
        )
    }
}
