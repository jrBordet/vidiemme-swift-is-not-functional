//: [Previous](@previous)

import Foundation

//: [Next](@next)

// Identity law

let maybe = Maybe<Int>(1)

let result = maybe.map { id($0) }

assert(unwrap(result) == unwrap(maybe))

let incr: (Int) -> Int = {
    $0 + 1
}

let square: (Int) -> Int = {
    $0 * $0
}

// composition

let incr_square = pipe(incr, square)

let result_composition: Maybe<Int> = maybe
    .map(incr_square)

let result_chaining: Maybe<Int> = maybe
    .map(incr)
    .map(square)

unwrap(result_composition)
unwrap(result_chaining)

let fancy: (Int) -> String = {
    "fancy \($0)"
}

pipe(pipe(incr, square), fancy) <^> Maybe<Int>(3)
