//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Jatin Pandey on 9/3/14.
//  Copyright (c) 2014 Jatin Pandey. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipPercentageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPercentageSet(sender: AnyObject) {

        var tipPercentage = NSString(string: tipPercentageField.text).doubleValue

        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tipPercentage, forKey: "defaultTipPercentage")
        defaults.synchronize()

    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}
