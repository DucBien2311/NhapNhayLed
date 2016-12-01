//
//  ViewController.swift
//  NhapnhayLed
//
//  Created by NguyenDucBien on 11/24/16.
//  Copyright © 2016 NguyenDucBien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var n = 5;
    var lastOnLed = -1
    var _marginRow: CGFloat = 50
    var _marginColumn: CGFloat = 50
    var count = 1
//    var direct = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBall()
        
        let Timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
    }
    func runningLed()
    {
        if (count == 1)
        {
            leftToRight()
        }
        else
        {
            rightToLeft()
        }
        
 
//        else if (count == 2)
//        {
//            direct = 2
//            upToDown()
//            
//        }
//        else if (count == 3)
//        {
//            rightToLeft()
//            
//        }
//        else
//        {
//            downToUP()
//            
//        }
        
    }
    
    
    func leftToRight()
    {
        if (lastOnLed != -1)
        {
        turnOffLed()
        
        }
        
        if (lastOnLed != n - 1)
        {
            lastOnLed = lastOnLed + 1
          
        }
        else
        {
            count = 2
            lastOnLed = n - 1
        }
        
        turnOnLed()
        
    }
    
    
//    func upToDown()
//    {
//        if (lastOnLed != -1)
//        {
//            turnOffLed()
//            
//        }
//        
//        if (lastOnLed != n - 1)
//        {
//            lastOnLed = lastOnLed + 1
//            
//        }
//        else
//        {
//            count = 3
//    
//            lastOnLed = n
//            
//        }
//        
//        turnOnLed()
//        
//    }
    

    
    func rightToLeft()
    {
        
        if (lastOnLed != n)
        {
        turnOffLed()
        }
        
        if (lastOnLed != -1 )
        {
            lastOnLed = lastOnLed - 1
            
        }
        else
        {
            count = 1
  
            lastOnLed = 1
            
        }
        
        turnOnLed()
        
        }
    
//    func downToUP()
//    {
//        
//        if (lastOnLed != n)
//        {
//            turnOffLed()
//        }
//        
//        if (lastOnLed != -1 )
//        {
//            lastOnLed = lastOnLed - 1
//            
//        }
//        else
//        {
//
//            count = 1
//            lastOnLed = 1
//            
//        }
//        
//        turnOnLed()
//        
//    }
    
    
    
    
    
    func turnOnLed()
    {
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView
        {
            ball.image = UIImage(named: "green")
        }
    }
    
    func turnOffLed()
    {
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView
        {
            ball.image = UIImage(named: "grey")
        }
    }
    
    
    

    func drawBall()
    {
        for indexRow in 0..<n {
            for indexColumn in 0..<n {
                let picture = UIImage(named: "green")
                let ball = UIImageView(image: picture)
                ball.center = CGPointMake(_marginRow + CGFloat(indexRow) * spaceBetweenBallWidth(), CGFloat(indexColumn) * spaceBetweenBallHeight() + _marginColumn)
                
//                if (direct == 1)
//                {
                ball.tag = indexRow + 100
//                }
//                else
//                {
//                ball.tag = indexColumn + 100
//                }
                self.view.addSubview(ball)
            }
        }
    }
    
    
    func spaceBetweenBallWidth() -> CGFloat
    {
        let spaceRow = (self.view.bounds.size.width - 2 * _marginRow)/CGFloat(n-1)
        return spaceRow
    }
    
    
    func spaceBetweenBallHeight() -> CGFloat
    {
        let spaceColumn = (self.view.bounds.size.height - 2 * _marginColumn)/CGFloat(n-1)
        return spaceColumn
    }

}

