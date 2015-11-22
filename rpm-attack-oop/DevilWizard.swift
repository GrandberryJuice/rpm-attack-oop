//
//  DevilWizard.swift
//  rpm-attack-oop
//
//  Created by KENNETH GRANDBERRY on 11/17/15.
//  Copyright © 2015 KENNETH GRANDBERRY. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot:[String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type:String {
        return "Devil Wizard"
    }
}