//
//  CounterViewModel.swift
//  PropertyWrappers2
//
//  Created by Andrew Vanderwilt on 10/2/25.
//
import Foundation
import Observation

@Observable
class CounterViewModel {
    var count: Int = 0
    
    init(count: Int) {
        self.count = count
    }
    
    func incriment() {
        count += 1
    }
    
    func reset() {
        count = 0
    }
}
