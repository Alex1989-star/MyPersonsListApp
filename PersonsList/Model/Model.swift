//
//  Model.swift
//  PersonsList
//
//  Created by Леся on 09.06.2021.
//

struct Person {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
}

class DataManager {
    static let firstNames: Set<String> = ["Leo", "Cristiano", "Zlatan", "Vladimir", "Vladimir", "German", "Ilon", "Mark", "Tim"]
    static let lastNames: Set<String> = ["Messi", "Ronaldo", "Ibrahimovic", "Sharapov", "Zolotov", "Tkachenko", "Mask", "Zuckerberg", "Cook"]
    static let emails: Set<String> = ["mail.ru", "gmail.com", "yandex.ru", "icloud.com", "rambler.ru"]
    static var persons = [Person]()
    
    static func getPersons() -> [Person] {
        return persons.isEmpty ? getRandomPersons() : persons
    }
    
    static private func getRandomPersons() -> [Person] {
        var firstNames = DataManager.firstNames
        var lastNames = DataManager.lastNames
        
        while !firstNames.isEmpty || !lastNames.isEmpty {
            let lastName = lastNames.popFirst()!
            persons.append(
                Person(
                    firstName: firstNames.popFirst() ?? "",
                    lastName: lastName,
                    phoneNumber: "+" + String(Int.random(in: 100000000...999999999)),
                    email: lastName.lowercased() + "@" + emails.randomElement()!
                )
            )
        }
        return persons
    }
}
