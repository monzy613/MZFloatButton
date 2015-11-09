//
//  ViewController.swift
//  FloatBottomButton
//
//  Created by Monzy on 15/11/9.
//  Copyright © 2015年 Monzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var fButton: MZFloatButton?

    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        panGesture.delegate = self
        fButton = MZFloatButton().configure(self.view, _percent: 0.15, _image: UIImage(named: "add"), _title: nil, _backgroundColor: UIColor.whiteColor(), _toggleDuration: 0.1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleFloatingButton(sender: UIButton) {
        fButton?.toggle()
    }

    @IBAction func panned(sender: UIPanGestureRecognizer) {
        let velocity = sender.velocityInView(view)
        if panGesture.state == .Ended {
            print("Pan End: \(velocity)")
        } else {
            return
        }
        if abs(velocity.y) > abs(velocity.x) {
            if velocity.y > 0 {
                fButton?.hide()
            } else if velocity.y < 0 {
                fButton?.show()
            }
        }
    }
    
    
    
}

