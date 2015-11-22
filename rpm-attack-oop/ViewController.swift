//
//  ViewController.swift
//  rpm-attack-oop
//
//  Created by KENNETH GRANDBERRY on 11/17/15.
//  Copyright © 2015 KENNETH GRANDBERRY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var PlayerHpLbl: UILabel!
    @IBOutlet weak var EnemyHpLbl: UILabel!
    @IBOutlet weak var EnemyImg: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    
    var player:Player!
    var enemy:Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        player = Player(name:"DirtyLaundry 21", hp:110, attackPwr: 20)
        
        generateRandomEnemy()
        
        PlayerHpLbl.text = "\(player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        if rand == 0{
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        
        EnemyImg.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    @IBAction func onChestTapped(sender: AnyObject) {
        
        chestButton.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            EnemyHpLbl.text = "\(enemy.hp)HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            EnemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            EnemyImg.hidden = true
        }
    }

}

