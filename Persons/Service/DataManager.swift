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
        "Дымка"
    ]
    private let secondNameArray = [
        "Иванов",
        "Петров",
        "Котейкин",
        "Котэнатор"
    ]
    private let phoneArray = [
        79991234567,
        71234567890,
        79213333333,
        79005005050
    ]
    private let emailArray = [
        "cat@gmail.com",
        "myrz@yandex.ru",
        "dym@mail.ru",
        "sonya@sonya.cat"
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
