//
//  Character.swift
//  rpm-attack-oop
//
//hp-hit power
//attackPwr-attack Power
//  Created by KENNETH GRANDBERRY on 11/17/15.
//  Copyright © 2015 KENNETH GRANDBERRY. All rights reserved.
//

import Foundation

class Character {
    //underscore is for computed properities
    private var _hp:Int = 100
    private var _attackPwr:Int = 10
    
    var attackPwr:Int {
        get {
            return _attackPwr
        }
    }
    
    var hp:Int {
        get {
            return _hp
        }
    }
    
    init(startingHp:Int, attackPwr:Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    //computed properity
    var isAlive:Bool {
        get {
            if hp <= 0{
                return false
            } else {
                return true
            }
        }
    }
    
    func attemptAttack(attackPwr:Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
}