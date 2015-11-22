//
//  Enemy.swift
//  rpm-attack-oop
//
//  Created by KENNETH GRANDBERRY on 11/17/15.
//  Copyright © 2015 KENNETH GRANDBERRY. All rights reserved.
//

import Foundation

class Enemy:Character {
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Butler"]
    }
    
    var type:String {
        return "Grunt"
    }
    
    func dropLoot() -> String?  {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
    
}