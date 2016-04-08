//
//  ShakeFirstResponderDummy.swift
//  openSensorApp
//
//  Created by ouba on 2016/04/08.
//  Copyright © 2016年 oubakiou. All rights reserved.
//

import UIKit

class ShakeFirstResponderDummy: UIView {

    var delegate: Shake?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
    }
    
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        delegate?.callback()
    }

}
