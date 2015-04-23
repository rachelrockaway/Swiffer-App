//
//  TimeLineTableViewController.swift
//  SwifferApp
//
//  Created by Rachel Stevenson on 4/22/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class TimeLineTableViewController: UITableViewController {
    
    var timelineData:NSMutableArray = NSMutableArray()
    
    func loadData(){
        timelineData.removeAllObjects()
        
        var findTimelineData:PFQuery = PFQuery(className: "Sweets")
        
        findTimelineData.findObjectsInBackgroundWithBlock {
            (objects:[AnyObject]!, error:NSError!) -> Void in
            
            if error == nil {
                for object in objects{
                    let sweet:PFObject = object as PFObject
                    self.timelineData.addObject(sweet)
                }
                
                let array:NSArray = self.timelineData.reverseObjectEnumerator().allObjects
                self.timelineData = NSMutableArray(array: array)
                
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        self.loadData() 
        
        if PFUser.currentUser() == nil {
            var loginAlert:UIAlertController = UIAlertController(title: "Sign Up / Login", message: "Please sign up or login", preferredStyle: UIAlertControllerStyle.Alert)
            
            loginAlert.addTextFieldWithConfigurationHandler({
                textfield in
                textfield.placeholder = "Your username"
            })
            
            loginAlert.addTextFieldWithConfigurationHandler({
                textfield in
                textfield.placeholder = "Your password"
            })
            
            loginAlert.addAction(UIAlertAction(title: "Login", style: UIAlertActionStyle.Default, handler: {
                alertAction in
                let textFields:NSArray = loginAlert.textFields as AnyObject! as NSArray
                let usernameTextField:UITextField = textFields.objectAtIndex(0) as UITextField
                let passwordTextField:UITextField = textFields.objectAtIndex(1) as UITextField
                
                PFUser.logInWithUsernameInBackground(usernameTextField.text, password: passwordTextField.text){
                    (user:PFUser!, error:NSError!)->Void in
                    if user != nil {
                        println("Login successful")
                    }else{
                        println("Login failed")
                    }
                    
                }
                
            }))
            
            loginAlert.addAction(UIAlertAction(title: "Sign Up", style: UIAlertActionStyle.Default, handler: {
                alertAction in
                let textfields:NSArray = loginAlert.textFields as AnyObject! as NSArray
                let usernameTextField = textfields.objectAtIndex(0) as UITextField
                let passwordTextField = textfields.objectAtIndex(1) as UITextField
                    
                var sweeter:PFUser = PFUser()
                sweeter.username = usernameTextField.text
                sweeter.password = passwordTextField.text
                sweeter.signUpInBackgroundWithBlock{
                    (success:Bool!, error:NSError!)->Void in
                    if error == nil{
                        println("Sign up successful")
                    }else{
                        let errorString = error.localizedDescription
                        println(errorString)
                    }
                }
                
            }))
            self.presentViewController(loginAlert, animated: true, completion: nil)

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return timelineData.count
    }


    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell {
        let cell:SweetTableViewCell = tableView!.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath!) as SweetTableViewCell

        let sweet:PFObject = self.timelineData.objectAtIndex(indexPath!.row) as PFObject
        
        cell.sweetTextView.text = sweet.objectForKey("content") as String
        
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
