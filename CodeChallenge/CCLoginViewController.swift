//
//  ViewController.swift
//  CodeChallenge
//
//  Created by Bhrigesh Chawda on 30/06/16.
//  Copyright © 2016 Bhrigesh Chawda. All rights reserved.
//

import UIKit

class CCLoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
    override func viewWillAppear(animated: Bool) {
         self.navigationController?.navigationBarHidden = true
    }
    
@IBAction func loginButtonAction(sender: AnyObject) {
        
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setValue(userNameTextField.text, forKey: "Username")
    defaults.setValue(passwordTextField.text, forKey: "Password")
    defaults.synchronize()
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let objCCMyDashboardViewController = storyboard.instantiateViewControllerWithIdentifier("myDashBoard") as! CCMyDashboardViewController
    
     self.navigationController?.pushViewController(objCCMyDashboardViewController, animated: true)
    
    }

    
    // MARK: TextField Delegates and Methods
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

