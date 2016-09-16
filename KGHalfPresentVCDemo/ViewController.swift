//
//  ViewController.swift
//  KGHalfPresentVCDemo
//
//  Created by Kevin Guo on 2016-09-16.
//  Copyright © 2016 Kevin Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBAction func presentModelBtnTapped(sender: AnyObject) {
        presentHalfModalVc()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "halfModalSegueId" {
            segue.destinationViewController.modalPresentationStyle = .Custom
            segue.destinationViewController.transitioningDelegate = self 
        }
    }

    func presentHalfModalVc() {
        
        let halfModalVc = UIViewController()
        halfModalVc.modalPresentationStyle = .Custom
        halfModalVc.transitioningDelegate = self  // let its hosting Vc be the delegate
        
        halfModalVc.view.backgroundColor = UIColor.lightGrayColor()
        let dismissBtn = UIButton(type: .System)
        dismissBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        dismissBtn.setTitle("Go back", forState: .Normal)
        dismissBtn.addTarget(self, action: #selector(ViewController.dismissBtnTapped), forControlEvents: UIControlEvents.TouchUpInside)
        
        halfModalVc.view.addSubview(dismissBtn)
        
        self.presentViewController(halfModalVc, animated: true, completion: nil)
    }
    
    
    func dismissBtnTapped(sender : AnyObject) {
        presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate Methods
    ////////////////////////////////////////////////////////
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return HalfSizeModalPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    
}

class HalfSizeModalPresentationController : UIPresentationController {
    override func frameOfPresentedViewInContainerView() -> CGRect {
        return CGRect(x: 0, y: (containerView?.bounds.height)! / 2, width: (containerView?.bounds.width)!, height: (containerView?.bounds.height)! / 2)
    }
}
