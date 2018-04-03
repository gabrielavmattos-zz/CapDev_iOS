//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print("teste2")

class Point: CustomStringConvertible {
    var x: Float = 0
    var y: Float = 0
    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        return "[x: \(x),  y: \(y)]"
    }
}

struct Shape {
    var center: Point
}

var initialPoint = Point(x: 0, y: 0)
let circle = Shape(center: initialPoint)
let square = Shape(center: initialPoint)

square.center.x = 5
circle.center
