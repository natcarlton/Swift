//
//  HistoryViewController.swift
//  TabbedCalc01-nancarl
//
//  Created by Natasha Carlton on 2/8/23.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyText: UITextView!
    var currentIndex = 0
    
    var appDelegate: AppDelegate?
    var myModel: TabbedCalc01Model?
    
    func writeToScreen() {
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.myModel = currAppDelegate.theModel
        } else {
            print("Cannot unwrap the model.")
        }
        if let currModel = self.myModel {
            // creating a new array from the whole calculationList so that we only have to print the new calculations in the list instead of printing them all each time
            // calculation list is a list of a list of the strings in the calculation, i.e. [['1', '+', '1', '10'], ...]
            let newHistory = Array(currModel.calculationList[currentIndex ..< currModel.calculationList.count])
            for calculation in newHistory {
                // checking just to make sure there are 4 items in our calculation
                if (calculation.count == 4) {
                    // adding the calculation to the text
                    var newHistory = "\(calculation[0]) \(calculation[1]) \(calculation[2])\n"
                    newHistory += "= \(calculation[3])\n\n"
                    
                    historyText.text += newHistory
                    // setting the new current index so that we can know where we left off in the history list, I did it this way instead of making a new history list in the model each time because I felt history persistence was important in case you want to do something more with the past history in the code later
                    currentIndex = currModel.calculationList.count
                }
            }
        } else {
            print("Cannot unwrap the delegate")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // I read the documentation for UIViewController and this seemed to work to load the history every time this tab is visited
    // this will call the function every time that the history screen comes into view
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        writeToScreen()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
