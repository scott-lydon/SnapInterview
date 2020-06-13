//
//  LazyInitialization.swift
//  SnapInterview
//
//  Created by Scott Lydon on 6/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

// var a = Int(readLine()!)!
// lazy var b = {
    
// }

// print(a + b)

/// Lazy components
/// nil to start
/// value assigned when read first time.
/// value stored after that.

struct Lazy<T> {
    
    private var stored: T?
    
    private mutating func prop() -> T? {
        self.stored = initialize()
        return initialize()
    }
    
    
    mutating func useProp() -> T? {
        @synchronize(self) {
            stored ?? prop()
        }
    }
    
    var initialize: () -> T?

    init(initialize: @escaping () -> T?) {
        self.initialize = initialize
    }
}

/// t1  calls useProp()
/// t2 calls useProp()
/// t2 enqueued as a task
/// t1 returns from useProp()
/// t2 returns from useProp()

extension Lazy {
    var testStored: T? {
        stored
    }
}

/// 1st test
var myInt = Lazy<Int?>(initialize: {
    10
})

print(myInt.testStored == nil)

if let prop = myInt.useProp () {
    print(prop == 10)
}
if let prop = myInt.useProp() {
    print(prop < 11)
}
if let prop = myInt.useProp() {
    print(prop > 9)
}


// var testme = 2
// var myInt = Lazy<Int?>(initialize: {
//     testme
// })
// print(myInt.useProp() == Optional(2))
// testme = 5
// print(myInt.useProp() != Optional(5))

// var str = Lazy<String?>(initialize: {
//     "Cats"
// })
// print(str.useProp() == Optional("Cats"))
// print(str.useProp() != Optional("Dogs"))

