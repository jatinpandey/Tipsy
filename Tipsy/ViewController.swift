//
//  ViewController.swift
//  Tipsy
//
//  Created by Jatin Pandey on 9/2/14.
//  Copyright (c) 2014 Jatin Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var defaultLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        var defaults = NSUserDefaults.standardUserDefaults()
        var defPerc = defaults.objectForKey("defaultTipPercentage") as Double
        var defPercDisp = Int(defPerc * 100)
        defaultLabel.text = "\(defPercDisp)%"
        updateTotal(self)

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTotal(bill: Double, tipPercentage: Double) -> Double {
        var tip = bill * (tipPercentage)
        var total = bill + tip
        return total
    }
    
    
    @IBAction func updateOnSegmentUpdated(sender: AnyObject) {
        var tipPercentages = [0.12, 0.15, 0.20]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        
        var total = calculateTotal(billAmount
            , tipPercentage: tipPercentage)
        
        tipLabel.text = String(format: "$%.2f", tipPercentage*billAmount)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    @IBAction func updateTotal(sender: AnyObject) {
        //var tipPercentages = [0.12, 0.15, 0.20]
        //var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var defaultPercentage = defaults.objectForKey("defaultTipPercentage") as Double
        
        var billAmount = NSString(string: billField.text).doubleValue

        var total = calculateTotal(billAmount
            , tipPercentage: defaultPercentage)
        
        tipLabel.text = String(format: "$%.2f", billAmount * defaultPercentage)
        totalLabel.text = String(format: "$%.2f", total)

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

