import Cocoa

var greeting = "Hello, playground"


let container = Maybe<Int>(1)

let result = container.map { $0 + 1 }

assert(unwrap(result) == 2)
