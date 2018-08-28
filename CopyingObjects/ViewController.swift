//
//  ViewController.swift
//  CopyingObjects
//
//  Created by Sreekanth Iragam Reddy on 8/12/18.
//  Copyright © 2018 Sreekanth Iragam Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testStructObjectCopying()
        testClassObjectsCopying()
        testArrays()
        testDictionaries()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Structs are Copy by content
    func testStructObjectCopying() {
        struct Person {
            var name: String?
            var lastName: String?
        }

        let p = Person(name: "reddy", lastName: "sree")
        var v = p
        v.lastName = "KKKK"
        print(v.lastName ?? "")
        print(p.lastName ?? "")
    }

    // Copying class references by content using NSCopying protocol
    func testClassObjectsCopying() {
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
                copy.card = self.card?.copy() as? Card
                return copy
            }

        }

        let personObj = PersonD()
        personObj.card = Card(number: 1111)
        personObj.personAge = 25
        personObj.personName = "iragam"

        let personObject1 = personObj.copy() as? PersonD
        personObject1?.personAge = 30
        personObject1?.card?.carNumber = 9999
        print(personObj.personAge)
        print(personObject1?.personAge ?? "")
        print(personObj.card?.carNumber)
        print(personObject1?.card?.carNumber ?? "")
    }

    func testArrays() {
        //Copy by reference
        let myArray = NSMutableArray(array: ["reddy","sree"])
        let newArry = myArray
        newArry[0] = "RR"
        print(newArry)
        print(myArray)

        // Copy by content
        let newAr = ["grey","free"]
        var new = newAr
        new[0] = "newcolor"
        print(new)
        print(newAr)

    }

    func testDictionaries() {
        // Copy by reference
        let mutArray = NSMutableDictionary(objects: ["sree","reddy","iragam"], forKeys: ["name" as NSCopying,"lastname" as NSCopying,"firstname" as NSCopying])
        let newMutArray = mutArray
        newMutArray["name"] = "JJJJ"
        print(mutArray)
        print(newMutArray)

        // Copy by content
        let mutAr = ["name":"sree","last":"reddy","first":"iragam"]
        var newmutAr = mutAr
        newmutAr["name"] = "KKK"
        print(mutAr)
        print(newmutAr)



    }
}

