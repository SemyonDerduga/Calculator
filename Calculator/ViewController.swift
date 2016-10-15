//
//  ViewController.swift
//  Calculator
//
//  Created by Семён Дердуга on 13.10.16.
//  Copyright © 2016 Семён Дердуга. All rights reserved.
//

import UIKit
var x:Double=0
var y:Double=0
var operationActiv = 0
var enterFlag = 1
var yFlag = 1
var decimalPoint=0
var power = 1
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitals(_ sender: UIButton) {
        print("Цифра : \(sender.tag)\n")
        
        
        if enterFlag==1 {
            x=0
            enterFlag=0
        }
        if decimalPoint==0{
        x = x * 10 + Double(sender.tag)
        self.result.text = " " + String(x)
        }else{
            x = x + Double(sender.tag)/pow(10,Double(power))
            power += 1
            self.result.text = " " + String(x)
        }
    }

    @IBAction func operation(_ sender: UIButton) {
        print("Операция : \(sender.tag)\n")
    if enterFlag != 1 && yFlag == 1
    {
        switch operationActiv
        {
        case 1001:
            x = y + x
            
        case 1002:
            x = y - x
            
        case 1003:
            x = x * y
            
        case 1004:
            x = y / x
            
            
            
        default: self.result.text = " " + String(x)
        }
        }
        operationActiv = sender.tag
        y = x
        yFlag = 1
        enterFlag = 1
        
        self.result.text = " " + String(x)
        decimalPoint=0
        power = 1
    }
    @IBAction func decimal(_ sender: UIButton) {
        if decimalPoint==0{
            decimalPoint=1
           
        }
            print("Точка\n")
    }
    @IBAction func inverse(_ sender: UIButton) {
        x=x*(-1)
        self.result.text = " " + String(x)
    }
    @IBAction func clearAllClear(_ sender: UIButton) {
        print("C")
        enterFlag = 1
        yFlag = 1
        power = 1
        
        decimalPoint=0
        x=0
        y=0
        self.result.text = " " + String(x)
        
    }
    
    @IBOutlet weak var result: UILabel!
}

