//
//  ViewController.swift
//  Calculadora
//
//  Created by Christian Torres on 7/17/21.
//

import UIKit

enum Operation: String {
    case addition = "+"
    case substraction = "-"
    case multiplication = "x"
    case division = "/"
    case equal = "="
}

class CalculadoraViewController: UIViewController {

    private var leftOperating: Double?
    private var operation: Operation?
    private var hasFinishedEntering = false
    
    @IBOutlet weak var entryLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchNumber(_ sender: UIButton) {
        var currentValue = entryLbl.text ?? ""
        let enterValue = sender.title(for: .normal)!
        if ("0" == currentValue || hasFinishedEntering) {
            currentValue = ""
            hasFinishedEntering = false
        }
        entryLbl.text = "\(currentValue)\(enterValue)"
    }
    
    private func performOperation(_ operation: Operation, withOperando operando: Double) {
        if (leftOperating == nil) {
            if (operation == .equal || operando == 0) {
                return;
            }

            leftOperating = operando;
            self.operation = operation;
            hasFinishedEntering = true
        } else {
            guard let leftOperating = self.leftOperating, let establishedOperation = self.operation else {
                return;
            }

            let result: Double;
            switch establishedOperation {
            case .addition:
                result = leftOperating + operando
            case .substraction:
                result = leftOperating - operando
            case .multiplication:
                result = leftOperating * operando
            case .division:
                result = leftOperating / operando
            default:
                result = 0
                print("\(establishedOperation) is not supported")
            }
            
            self.leftOperating = nil
            self.operation = nil
            if (operation != .equal) {
                performOperation(operation, withOperando: result)
            }
            entryLbl.text = result.clean
        }
    }

    @IBAction func touchOperator(_ sender: UIButton) {
        let operando = Double(self.entryLbl.text!)!
        let operation = Operation(rawValue: sender.title(for: .normal)!)!
        
        performOperation(operation, withOperando: operando)
    }

    @IBAction func clean() {
        self.entryLbl.text = "0"
        self.leftOperating = nil
        self.operation = nil
        self.hasFinishedEntering = false
    }
}
