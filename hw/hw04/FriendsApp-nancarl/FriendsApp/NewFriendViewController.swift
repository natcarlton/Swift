//
//  ViewController.swift
//  NewFriendViewController
//
//  Created by Natasha Carlton on 2/21/23.
//  nancarl@iu.edu
//

import UIKit

class NewFriendViewController: UIViewController, UITextFieldDelegate {
    
    var appDelegate: AppDelegate?
    var friendsModel: FriendsModel?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        email.resignFirstResponder()
        return true
    }
    
    @IBAction func addFriend(_ sender: Any) {
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.friendsModel = currAppDelegate.myFriendsModel
            // if there is something in the text fields
            if (self.firstName != nil && self.lastName != nil && self.email != nil) {
                // we know the values are not nil so I am force unwrapping
                // for trimming off the spaces before and after the string https://developer.apple.com/documentation/swift/stringprotocol/trimmingcharacters(in:)
                // for white spaces https://developer.apple.com/documentation/foundation/characterset
                let trimmedFirstName = self.firstName.text!.trimmingCharacters(in: .whitespaces)
                let trimmedLastName = self.lastName.text!.trimmingCharacters(in: .whitespaces)
                let trimmedEmail = self.email.text!.trimmingCharacters(in: .whitespaces)
                if (trimmedFirstName != "" && trimmedLastName != "" && trimmedEmail != "") {
                    self.friendsModel?.addNewFriend(firstName: trimmedFirstName, lastName: trimmedLastName, email: trimmedEmail)
                }
                // reset the text fields
                self.firstName.text! = ""
                self.lastName.text! = ""
                self.email.text! = ""
            }
        } else {
            print("Cannot unwrap the model.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // for the keyboard return
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.email.delegate = self
    }
    
}

