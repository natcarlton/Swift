//
//  FriendsTableViewController.swift
//  FriendsApp
//
//  Created by Natasha Carlton on 2/21/23.
//  nancarl@iu.edu
//
import UIKit

class FriendsTableViewController: UITableViewController {
    
    var appDelegate: AppDelegate?
    var friendsModel: FriendsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myTableView = self.view as? UITableView {
            myTableView.reloadData()
            self.tableView.rowHeight = 100
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        var numSections = 0
        
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.friendsModel = currAppDelegate.myFriendsModel
            if let currFriendsModel = self.friendsModel {
                // get the count of all the different last name letters that the friends have for the number of sections
                numSections = currFriendsModel.getLastNameLetters().count
            }
        }
        
        return numSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // refer to the model
        var numRowsInSection = 0
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.friendsModel = currAppDelegate.myFriendsModel
            if let currFriendsModel = self.friendsModel {
                // number of rows in the section is the friends that fall under the sections letter
                numRowsInSection = currFriendsModel.getFriendsForSection(section: section).count
            }
        }
        return numRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsTableViewCell", for: indexPath) as! FriendsTableViewCell
        
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.friendsModel = currAppDelegate.myFriendsModel
            if let currFriendsModel = self.friendsModel {
                // get our friend for the row in the current section
                let friend = currFriendsModel.getFriendsForSection(section: indexPath.section)[indexPath.row]
                cell.firstName.text = friend[0]
                cell.lastName.text = friend[1]
                cell.email.text = friend[2]
            }
        }
        // Configure the cell...
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        // this should be in the model
        var tableSectionHeader = ""
        
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.friendsModel = currAppDelegate.myFriendsModel
            if let currFriendsModel = self.friendsModel {
                // the section headers are the unique last name letters
                tableSectionHeader = currFriendsModel.getLastNameLetters()[section]
            }
        }
        return tableSectionHeader
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
