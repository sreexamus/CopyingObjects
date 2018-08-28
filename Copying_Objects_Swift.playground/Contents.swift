//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Person {
    var name: String?
    var lastName: String?
}

let p = Person(name: "reddy", lastName: "sree")
var v = p
v.lastName = "yoyo"
print("sree")

class Card: NSCopying {
    var carNumber:Int?
    init(number: Int) {
        carNumber = number
    }
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Card(number: self.carNumber!)
        return copy
    }
}

class PersonD : NSCopying{
    var personName : String?
    var personAge : Int?
    var card: Card?

    func copy(with zone: NSZone? = nil) -> Any {
        let copy = PersonD()
        copy.personName = self.personName
        copy.personAge = self.personAge
        copy.card = self.card?.copy() as! Card
        return copy
}

}

let personObj = PersonD()
personObj.card = Card(number: 10)
personObj.personAge = 25
personObj.personName = "iragam"
print(personObj)





