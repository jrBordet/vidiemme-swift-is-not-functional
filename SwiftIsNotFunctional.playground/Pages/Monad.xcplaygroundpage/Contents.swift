//: [Previous](@previous)

import Foundation

//: [Next](@next)

func half(_ a: Int) -> Maybe<Int> {
    a % 2 == 0 ? Maybe(a / 2) : Maybe<Int>.none
}

Maybe(3) >>- half
// .none
Maybe(4) >>- half
// 2
Maybe.none >>- half
// .none

let result = Maybe(20) >>- half >>- half

let incr: (Int) -> Maybe<Int> = {
    $0 > 0 ? Maybe($0 + 1) : .none
}

let fancy: (Int) -> Maybe<String> = {
    $0 > 0 ? .value("fancy \($0)") : .none
}

let compute =
    half(_:)
    >=> incr
    >=> fancy

let resultFancy = compute(100)

compute(-1)
