//
//  Person.swift
//  Persons
//
//  Created by Михаил Зиновьев on 09.11.2021.
//

import Foundation

struct Person {
    let name: String
    let secondName: String
    let phoneNumber: Int
    let email: String
}

//stub
extension Person {
    static func getPersonList() -> [Person] {
        return [
            Person(name: "Mich", secondName: "Tompson", phoneNumber: 79991234567, email: "email@gmail.com")
        ]
    }
}
