//
//  ViewController.swift
//  Calculadora
//
//  Created by Christian Torres on 7/17/21.
//

import UIKit

class CalculadoraViewController: UIViewController {

    @IBOutlet weak var entryLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touch(_ sender: UIButton) {
        var currentValue = self.entryLbl.text ?? ""
        let enterValue = sender.title(for: .normal)!
        if ("0" == currentValue) {
            currentValue = ""
        }
        self.entryLbl.text = "\(currentValue)\(enterValue)"
    }

}
