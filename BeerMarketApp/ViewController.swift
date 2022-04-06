//
//  ViewController.swift
//  BeerMarketApp
//
//  Created by Seyran Saakyan on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var beerOneLabel: UILabel!
    @IBOutlet weak var beerTwoLabel: UILabel!
    @IBOutlet weak var beerThreeLabel: UILabel!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var startDayButton: UIButton!
    @IBOutlet weak var endDayButton: UIButton!
    @IBOutlet weak var beerOneStackView: UIStackView!
    @IBOutlet weak var beerTwoStackView: UIStackView!
    @IBOutlet weak var beerThreeStackView: UIStackView!
    @IBOutlet weak var finalSellLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        finalSellLabel.text = ""
        corners(sender: sellButton)
        corners(sender: startDayButton)
        corners(sender: endDayButton)
        cornersForStack(sender: beerOneStackView)
        cornersForStack(sender: beerTwoStackView)
        cornersForStack(sender: beerThreeStackView)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func beerOnePlus() {
        var beerOneInt = Int(beerOneLabel.text!)
        beerOneInt! += 1
        beerOneLabel.text = String(beerOneInt!)
    }
    
    @IBAction func beerOneMinus() {
        if Int(beerOneLabel.text!)! > 0{
            var beerOneInt = Int(beerOneLabel.text!)
            beerOneInt! -= 1
            beerOneLabel.text = String(beerOneInt!)
        }
    }
    
    @IBAction func beerThreeMinus() {
        if Int(beerThreeLabel.text!)! > 0{
            var beerThreeInt = Int(beerThreeLabel.text!)
            beerThreeInt! -= 1
            beerThreeLabel.text = String(beerThreeInt!)
        }
    }
    @IBAction func beerTwoPlus() {
        var beerTwoInt = Int(beerTwoLabel.text!)
        beerTwoInt! += 1
        beerTwoLabel.text = String(beerTwoInt!)
    }
    
    @IBAction func beerTwoMinus() {
        if Int(beerTwoLabel.text!)! > 0{
            var beerTwoInt = Int(beerTwoLabel.text!)
            beerTwoInt! -= 1
            beerTwoLabel.text = String(beerTwoInt!)
        }
    }
    @IBAction func beerThreePlus() {
        var beerThreeInt = Int(beerThreeLabel.text!)
        beerThreeInt! += 1
        beerThreeLabel.text = String(beerThreeInt!)
    }
    
    
    func corners(sender: UIButton){
        sender.layer.cornerRadius = 15
    }
    func cornersForStack(sender: UIStackView){
        sender.layer.cornerRadius = 15
    }
    @IBAction func sellButtonPressed(_ sender: Any) {
        if beerOne.amount > Int(beerOneLabel.text!)!{
            beerOne.amount -= Int(beerOneLabel.text!)!
            //beerOneLabel.text = "0"
        } else {
            let alert = UIAlertController(title: "Error", message: "You have only \(beerOne.amount) bottle(s) of Beer 1", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        if beerTwo.amount > Int(beerTwoLabel.text!)!{
            beerTwo.amount -= Int(beerTwoLabel.text!)!
            //beerTwoLabel.text = "0"
        } else {
            let alert = UIAlertController(title: "Error", message: "You have only \(beerTwo.amount) bottle(s) of Beer 2", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        if beerThree.amount > Int(beerThreeLabel.text!)!{
            beerThree.amount -= Int(beerThreeLabel.text!)!
            //beerThreeLabel.text = "0"
        } else {
            let alert = UIAlertController(title: "Error", message: "You have only \(beerThree.amount) bottle(s) of Beer 3", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        finalSellLabel.text = "Final receipt: Beer 1 * \(beerOneLabel.text!) = \(String(Int(beerOneLabel.text!)! * beerOne.price))"
        beerOneLabel.text = "0"
        beerTwoLabel.text = "0"
        beerThreeLabel.text = "0"
    }
    @IBAction func startDayButtonPressed() {
        beerOne.amount = 100
        beerTwo.amount = 100
        beerThree.amount = 100
        finalSellLabel.text = "New day started, beer stocks were updated"
    }
    @IBAction func endDayButtonPressed() {
        let finalSalesAmount = ((100 - beerOne.amount) * beerOne.price) + ((100 - beerTwo.amount) * beerOne.price) + ((100 - beerThree.amount) * beerOne.price)
        finalSellLabel.text = "Sales per day: \(String(finalSalesAmount)) rubles. Well done!"
    }
}
