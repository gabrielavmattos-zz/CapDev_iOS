//: Playground - noun: a place where people can play

import UIKit

var firstName: String = "Steve"
var middleName: String? = "P"
let lastName: String = "Jobs"

print("\(firstName) \(middleName) \(lastName)")
print("\(firstName) \(middleName!) \(lastName)")

let mName = middleName ?? "outra coisa"
print(mName)

if let middle = middleName {
    print(middle)
} else {
    print("value is nil")
}

func unwrappWithGuard() {
    guard let unwrappMiddleName = middleName else {
        print("\(firstName)")
        return
    }
    print("\(firstName) \(unwrappMiddleName) \(lastName)")
}

unwrappWithGuard()
