//
//  solid.swift
//  SOLIDlab
//
//  Created by Andrew Vanderwilt on 10/28/25.
//

// Single Responsibility Principle
enum Attack {
    case slam
    case slash
    case bite
}

// Interface segregation principle
protocol Lootable {
    var loot: [String] { get }
    func dropLoot()
}

// open/closed principle
protocol Enemy {
    var name: String { get }
    var attack: Attack { get }
}

protocol Mortal {
    var health: Int { get set }
    var pointValue: Int { get }
    func die()
}

// open/closed principle
class SpikeTrap: Enemy {
    let name: String
    let attack: Attack
    
    init(name: String, attack: Attack) {
        self.name = name
        self.attack = attack
    }
}

class SlimeEnemy: Enemy, Mortal {
    let name: String
    let pointValue: Int
    var health: Int
    let attack: Attack
    func die() {}
    
    init(name: String, pointValue: Int, health: Int, attack: Attack) {
        self.name = name
        self.pointValue = pointValue
        self.health = health
        self.attack = attack
    }
}

struct SkeletonEnemy: Enemy, Mortal, Lootable {
    let name: String
    let pointValue: Int
    var health: Int
    let attack: Attack
    let loot: [String]
    func die() {}
    func dropLoot() {}
}

class healthUpdater {
    func updateHealth(_ enitity: Mortal, to newHealth: Int) {
        print("updated health")
    }
}

// Liskov Substitution Principle
class LootContainer: Lootable {
    let loot: [String]
    func dropLoot() {}
    
    init(loot: [String]) {
        self.loot = loot
    }
}

class Chest: LootContainer {
    var locked: Bool
    
    init(locked: Bool, loot: [String]) {
        self.locked = locked
        super.init(loot: loot)
    }
}

class Bag: LootContainer {
    override init(loot: [String]) {
        super.init(loot: loot)
    }
}
