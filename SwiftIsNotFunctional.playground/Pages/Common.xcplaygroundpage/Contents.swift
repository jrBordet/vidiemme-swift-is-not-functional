import Cocoa

var y = 1

incr(y)

sqr(y)


let array: [Int?] = Array(0...100)

//array
//    .filter { $0 != nil }
//    .map { $0 }
//    .map { $0 + 1 }

let a = array
//    .flatMap {
////        $0 != nil ? $0 : 0
//        if $0 != nil {
//            return $0
//        } else {
//
//        }
//
//    }

extension Optional {
    func compactMap(_ transform: @escaping (Wrapped) -> Wrapped, _ default: Wrapped) throws -> Optional<Wrapped> {
        guard let value = self else {
            throw NSError(domain: "", code: -1)
        }
        
        return transform(value)
    }
    
    func unwrap(
        _ transform: @escaping (Wrapped) -> Wrapped
    ) throws -> Wrapped {
        guard let value = self else {
            throw NSError(domain: "", code: -1)
        }
        
        return transform(value)
    }
    
    func incr(_ v: Int) throws -> Optional<Wrapped> where Wrapped == Int {
        guard let value = self else {
            throw NSError(domain: "", code: -1)
        }
        
        return value + v
    }
    
    func sqr() throws -> Optional<Wrapped> where Wrapped == Int {
        guard let value = self else {
            throw NSError(domain: "", code: -1)
        }
        
        return value * value
    }
    
    func compose(
        f: @escaping ((Wrapped) -> Wrapped) -> Optional<Wrapped>,
        g: @escaping ((Wrapped) -> Wrapped) -> Optional<Wrapped>
    ) throws -> ((Wrapped) -> Wrapped) -> Optional<Wrapped> {
//        let a = f(<#(Wrapped) -> Wrapped#>)
//        let b = g(a)
        fatalError()
    }
}

let o: Int? = 1

do {
    try o
        .compactMap { $0 + 1 }
        .map { $0 * $0 }
        .incr(3)
        .sqr()
        
} catch let e  {
    print("\(e.localizedDescription)")
}

if var _o = o {
    _o += 1
    _o *= _o
}

array
    .compactMap { $0 }
    .map { $0 + 1 }
