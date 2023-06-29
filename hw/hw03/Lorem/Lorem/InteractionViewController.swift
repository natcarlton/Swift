//
//  InteractionViewController.swift
//  Lorem
//
//  Created by Natasha Carlton on 2/14/23.
//  nancarl@iu.edu
//

import UIKit

class InteractionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loremText: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendInputButton: UIButton!
    var myModel = Lorem()
    var appDelegate: AppDelegate?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func textFieldAction(_ sender: Any) {

    }

    @IBAction func sendInputAction(_ sender: Any) {
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.myModel = currAppDelegate.theModel
            
            if self.loremText.text != nil {
                if let newText = self.textField.text {
                    self.loremText.text += "* \(newText)\n"
                    self.loremText.text += self.myModel.parseUserResponse(response: newText)
                    self.textField.text = ""
                }
            }
        } else {
            print("Cannot unwrap the model.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view.
    }
    


}

