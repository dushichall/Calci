//
//  ViewController.swift
//  Calculator_app
//
//  Created by Dushyanth Challagundla on 2/29/24.
//

import UIKit
import Darwin



class ViewController: UIViewController {
    var firstnumber: String = ""
    var secondnumber : String = ""
    var operation : String = ""
    var haveresult : Bool = false
    var resultnumber :String = ""
    var numberresult :String = ""
    
    @IBOutlet weak var NumberInput: UILabel!
    @IBOutlet var CalcButton: [UIButton]!
    
    @IBAction func numberpressed(_ sender: UIButton) {
        if operation == ""{
            firstnumber += String(sender.tag)
            NumberInput.text = firstnumber
        } else if operation != "" && !haveresult {
            secondnumber += String(sender.tag)
            NumberInput.text = secondnumber
        } else if operation != "" && haveresult {
            numberresult += String(sender.tag)
            NumberInput.text = numberresult
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        firstnumber = ""
        secondnumber  = ""
        operation  = ""
        haveresult  = true
        resultnumber  = ""
        numberresult  = ""
        NumberInput.text = "0"
    }
    
    @IBAction func Add(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func Subtraction(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func Multiply(_ sender: Any) {
        operation = "x"
    }
    
    @IBAction func Divide(_ sender: Any) {
        operation = "/"
    }
    
    @IBAction func Sine(_ sender: Any) {
        operation = "sin"
        calculateTrigonometricFunction()
    }
    
    @IBAction func Cosine(_ sender: Any) {
        operation = "cos"
        calculateTrigonometricFunction()
    }
    
    @IBAction func Tan(_ sender: Any) {
        operation = "tan"
        calculateTrigonometricFunction()
    }
    
    @IBAction func Equals(_ sender: Any) {
        resultnumber = String(doOperation())
        let numarray = resultnumber.components(separatedBy: ".")
        if numarray[1] == "0" {
            NumberInput.text = numarray[0]
        } else {
            NumberInput.text = resultnumber
            numberresult = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for buttons in CalcButton {
            buttons.layer.cornerRadius = buttons.frame.size.height / 2
            buttons.tintColor = .white
            buttons.titleLabel?.font = UIFont(name: "System", size: 24)
        }
    }
    
    func doOperation() -> Double {
        if operation == "+" {
            if !haveresult {
                haveresult = true
                return Double(firstnumber)! + Double(secondnumber)!
            } else {
                return Double(resultnumber)! + Double(numberresult)!
            }
        } else if operation == "-" {
            if !haveresult {
                haveresult = true
                return Double(firstnumber)! - Double(secondnumber)!
            } else {
                return Double(resultnumber)! - Double( numberresult)!
            }
        } else if operation == "x" {
            if !haveresult {
                haveresult = true
                return Double(firstnumber)! * Double(secondnumber)!
            } else {
                return Double(resultnumber)! * Double( numberresult)!
            }
        } else if operation == "/" {
            if !haveresult {
                haveresult = true
                return Double(firstnumber)! / Double(secondnumber)!
            } else {
                return Double(resultnumber)! / Double(numberresult)!
            }
        }
        return 0
    }
    
    func calculateTrigonometricFunction() {
        if let number = Double(firstnumber) {
            var result: Double = 0
            let angleInRadians = number * Double.pi / 180 // Convert degrees to radians
            print("Angle in radians:", angleInRadians)
            switch operation {
            case "sin":
                result = sin(angleInRadians)
            case "cos":
                result = cos(angleInRadians)
            case "tan":
                result = tan(angleInRadians)
            default:
                
                break
            }
            print("Result:", result)
            NumberInput.text = String(result)
        }
        
    }
}
