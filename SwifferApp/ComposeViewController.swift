//
//  ComposeViewController.swift
//  SwifferApp
//
//  Created by Rachel Stevenson on 4/22/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var SweetTextView: UITextView!
    
    @IBOutlet weak var charRemainingLabel: UILabel!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SweetTextView.layer.borderColor = UIColor.blackColor().CGColor
        SweetTextView.layer.borderWidth = 0.5
        SweetTextView.layer.cornerRadius = 5
        SweetTextView.delegate = self

        SweetTextView.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendSweet(sender: AnyObject) {
        
        var sweet = PFObject(className: "Sweets")
        sweet["content"] = SweetTextView.text
        sweet["sweeter"] = PFUser.currentUser()
        
        sweet.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                //The object has been saved
            } else {
                // There was a problem
            }
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range:NSRange, replacementText text: String) -> Bool {
        
        var newLength = (textView.text as NSString).length + (text as NSString).length - range.length
        var remainingChar = 140 - newLength
        
        charRemainingLabel.text = "\(remainingChar)"
        
        return (newLength >= 140) ? false : true 
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
