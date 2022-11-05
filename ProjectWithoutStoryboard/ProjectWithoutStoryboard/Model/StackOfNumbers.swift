//
//  StackOfNumbers.swift
//  ProjectWithoutStoryboard
//
//  Created by Lebedev Petr on 25.10.2022.
//

class StackOfNumbers {
    public private(set) var numbers:[Int] = [Int]()
    public init(fromArray numbers: [Int]){
        self.numbers = numbers
        capacity = numbers.count
        maxValue = numbers.max() ?? 0
    }
    private let capacity: Int
    private let maxValue: Int
    public func ReRand(){
        var set = Set<Int>()
        numbers.removeAll()
        var setSize = 0
        var rand = 0
        for _ in 0..<capacity{
            while(setSize == set.count){
                rand = Int.random(in: 0...maxValue)
                set.insert(rand)
            }
            numbers+=[rand]
            setSize = set.count
        }
    }
    public init(capacity: Int, maxValue: Int){
        self.maxValue = maxValue
        self.capacity = capacity
        ReRand()
    }
}
