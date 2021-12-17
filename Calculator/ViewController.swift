//
//  ViewController.swift
//  Calculator
//
//  Created by Rodrigo Lourenço on 08/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var calculator = Calculator()
    
    @IBOutlet var lblResult: UILabel!
    
    //---------------------------------------------------------
    //  MARK: - UIViewController
    //---------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //---------------------------------------------------------
    //  MARK: - Custom methods
    //---------------------------------------------------------
    
    @IBAction func numbers(sender: UIButton){
        calculator.tapped(number: sender.tag)
        lblResult.text = calculator.runningNumber
    }
    
    @IBAction func oparation(sender: UIButton){
        
        switch sender.tag {
            case 0: // div
                calculator.tapped(operation: .div)
            case 1: // mult
                calculator.tapped(operation: .mult)
            case 2: // sub
                calculator.tapped(operation: .sub)
            case 3: // sum
                calculator.tapped(operation: .sum)
            case 4: // equal
                calculator.finish()
                lblResult.text = calculator.result
            case 5:
                calculator.clean()
                lblResult.text = calculator.result
            default:
                print("funcao desconhecida")
                break
        }
        
    }
}
