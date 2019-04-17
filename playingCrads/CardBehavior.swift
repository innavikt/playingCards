//
//  CardBehavior.swift
//  playingCrads
//
//  Created by inna on 17/04/2019.
//  Copyright © 2019 inna. All rights reserved.
//

import UIKit

class CardBehavior: UIDynamicBehavior {
    
    lazy var collisionBehavior: UICollisionBehavior = {
        let behavoir = UICollisionBehavior()
        behavoir.translatesReferenceBoundsIntoBoundary = true
        return behavoir
    } ()
    
    lazy var itemBehavior: UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.allowsRotation = false
        behavior.elasticity = 1.0
        behavior.resistance = 0
        return behavior
    } ()
    
    private func push(_ item: UIDynamicItem) {
        let push = UIPushBehavior(items: [item], mode: .instantaneous)
        push.angle = (2 * CGFloat.pi).arc4random
        push.magnitude = 1.0 + CGFloat(2.0).arc4random
        
        push.action = { [unowned push, weak self] in
            self?.removeChildBehavior(push)
        }
        addChildBehavior(push)
    }
    
    override init() {
        super.init()
        addChildBehavior(collisionBehavior)
        addChildBehavior(itemBehavior)
    }
    
    convenience init(in animator: UIDynamicAnimator) {
        self.init()
        animator.addBehavior(self)
        
    }
    
    func addItem(_ item: UIDynamicItem) {
        collisionBehavior.addItem(item)
        itemBehavior.addItem(item)
        push(item)        
    }
    
    func removeItem(_ item: UIDynamicItem) {
        collisionBehavior.removeItem(item)
        itemBehavior.removeItem(item)
    }
    
}
