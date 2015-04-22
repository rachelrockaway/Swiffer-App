//
//  ComposeViewController.swift
//  SwifferApp
//
//  Created by Rachel Stevenson on 4/22/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var sweetTextView: UITextView!
    
    @IBOutlet weak var characterRemainingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sweetTextView.layer.borderColor = UIColor.blackColor().CGColor
        sweetTextView.layer.borderWidth = 0.5
        sweetTextView.layer.cornerRadius = 5

        sweetTextView.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendSweet(sender: UIBarButtonItem) {
        
        var sweet = PFObject(className: "Sweets")
        sweet["content"] = sweetTextView.text
        sweet["sweeter"] = PFUser.currentUser()
        
        sweet.saveInBackgroundWithBlock(nil)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
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
