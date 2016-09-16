//
//  HalfModalViewController.swift
//  KGHalfPresentVCDemo
//
//  Created by Kevin Guo on 2016-09-16.
//  Copyright © 2016 Kevin Guo. All rights reserved.
//

import Foundation
import UIKit

class HalfModalViewController: UIViewController {
    
    @IBAction func goBackBtnTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
