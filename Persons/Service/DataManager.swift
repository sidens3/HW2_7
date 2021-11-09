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
    private let secondNameArray: [String] = [
        "Иванов",
        "Петров",
        "Котейкин",
        "Котэнатор"
    ]
    private let phoneArray: [Int] = [
        79991234567,
        71234567890,
        79213333333,
        79005005050
    ]
    private let emailArray: [String] = [
        "cat@gmail.com",
        "myrz@yandex.ru",
        "dym@mail.ru",
        "sonya@sonya.cat"
    ]
    
    private var personsList: [Person] = []
    
    public func getPersonList(with personCount: Int) -> [Person] {
        return generatePersonsList(with: personCount)
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

