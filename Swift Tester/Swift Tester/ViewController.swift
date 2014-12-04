//
//  ViewController.swift
//  Swift Tester
//
//  Created by Blake Ellingham on 6/7/14.
//  Copyright (c) 2014 Blake Ellingham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func makeIncrementer() -> (Int -> Int) {
            func addOne(number: Int) -> Int {
                return 1 + number
            }
            return addOne
        }
        
        let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
        ]
        var largest = 0
        for (type, series) in interestingNumbers{
            for number in series{
                if largest < number {
                    largest = number
                }
            }
        }
        var size = 10
        for i in 0..size {
            if i > size - 2 {
                //cool
            }
        }
        var increment = makeIncrementer()
        println(increment(7))
        
        var numbers = [20, 19, 7, 12]
        var silly = numbers.map({
            (number: Int) -> Int in
            var mod = number
            if mod % 2 == 1 {
                mod = 3 * number
            }
            return mod
            })
        println(silly)
        enum Rank: Int {
            case Ace = 1
            case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
            case Jack, Queen, King
            func simpleDescription() -> String {
                switch self {
                case .Ace:
                    return "ace"
                case .Jack:
                    return "jack"
                case .Queen:
                    return "queen"
                case .King:
                    return "king"
                default:
                    return String(self.toRaw())
                }
            }
        }
        let ace = Rank.Ace
        let aceRawValue = ace.toRaw()
        let aceString = ace.simpleDescription()
        println("\(aceString) \(aceRawValue)")
        
        // Cool syntax concerning optionals
        var numberAsString = "123"
        if var numberAsInt = numberAsString.toInt() {
            numberAsInt = numberAsInt + 12
            println(numberAsInt)
        }
        else {
            println("Thats some bullsh")
        }
        
        // Example of a ternary conditional
        let contentHeight = 40
        let hasHeader = true
        let rowHeight = contentHeight + (hasHeader ? 50 : 20)
        // rowHeight is equal to 90
        
        // Ranges are first rate objects
        for indexArooni in 1..5{
            print(indexArooni)
        }
        for indexArooni in 1...5{
            print(indexArooni)
        }
        var bullsh = [1, "dog"]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func bullshit(person:String, place:String) -> String {
        return "SUP BIATCH \(person), you is a snuggy motha\(place)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var myTriAndSquare = TriangleAndSquare(size: 12.0, name: "boody-doo")
}

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    willSet {
        square.sideLength = newValue.sideLength
    }
    }
    var square: Square {
    willSet {
        triangle.sideLength = newValue.sideLength
    }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

class testEnum {
    enum OptionalValue<T> {
        case None
        case Some(T)
    }
    func bullsh() {
        var possibleInteger: OptionalValue<Int> = .None
        possibleInteger = .Some(100)
    }
}





