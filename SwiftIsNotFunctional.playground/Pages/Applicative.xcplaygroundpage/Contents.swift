import Foundation

//: [Previous](@previous)

//: [Next](@next)

func addition(_ lhs: Int, rhs: Int) -> Int {
    lhs + rhs
}

let a = Maybe(41)
let b = Maybe(1)

let result = curry(addition) <^> a <*> b

let a1: Int? = 41
let b1: Int? = 1

if let a = a1, let b = b1 {
    let result = addition(a, rhs: b) // 42
}

// Array as Applicative
let resultArray =  [ { $0 + 3 }, { $0 * 2 } ] <*> [1, 2, 3]
        
resultArray == [4, 5, 6, 2, 4, 6]
