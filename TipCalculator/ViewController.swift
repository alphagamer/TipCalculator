//
//  ViewController.swift
//  TipCalculator
//
//  Created by Hemanth Kumar on 15/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfBillAmount: UITextField!
    
    @IBOutlet weak var tfTipPercent: UITextField!
    
    @IBOutlet weak var lblBillAmount: UILabel!
    
    @IBOutlet weak var lblTipAmount: UILabel!
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    @IBOutlet weak var lblError: UILabel!
    
    private var tipCalculator: TipCalculator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipCalculator = TipCalculator()
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        print("Calculate Tip called")
        view.endEditing(false)
        guard let totalAmount = Double(tfBillAmount.text!),
              let tipPercent = Double(tfTipPercent.text!) else {
            lblError.text = "Invalid Input"
            hideResultLabels()
            return
        }
        do {
            let tipAmount = try tipCalculator.calculate(total: totalAmount, tipPercentage: tipPercent)
            lblBillAmount.text = "Bill Amount : $ \(totalAmount)"
            lblTipAmount.text = "Tip Amount : $ \(tipAmount)"
            lblTotalAmount.text = "Total Amount : $ \(totalAmount + tipAmount)"
            showResultLabels()
        } catch {
            lblError.text = "Invalid Input"
            hideResultLabels()
        }
    }
    
    private func hideResultLabels() {
        lblBillAmount.isHidden = true
        lblTipAmount.isHidden = true
        lblTotalAmount.isHidden = true
        lblError.isHidden = false
    }
    
    private func showResultLabels() {
        lblBillAmount.isHidden = false
        lblTipAmount.isHidden = false
        lblTotalAmount.isHidden = false
        lblError.isHidden = true
    }
    


}

