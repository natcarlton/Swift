//
//  Lab11TableViewController.swift
//  Lab11
//
//  Created by Natasha Carlton on 2/14/23.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var currentCell = 0
    var appDelegate: AppDelegate?
    var myModel: Lorem?

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
            self.currentCell = 0
        }
    }

    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("in Lab12TableViewController, tableView(numOfRowsInSection)")
                // #warning Incomplete implementation, return the number of rows
                var numRowsInSection = 0
                if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
                    self.myModel = currAppDelegate.theModel
                    
                    if let inputWords = self.myModel?.inputWords {
                        numRowsInSection = inputWords.count
                    }
                    
                    
                } else {
                    print("Cannot unwrap the model.")
                }
                print(numRowsInSection)
                return numRowsInSection

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myHistoryTableViewCell", for: indexPath) as UITableViewCell
        //         Configure the cell...
                if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
                    self.myModel = currAppDelegate.theModel
                    
                    if let outputWords = self.myModel?.outputWords, let inputWords = self.myModel?.inputWords {
                     
                        cell.textLabel?.text = "User > \(inputWords[self.currentCell])"
                            if cell.detailTextLabel != nil {
                                cell.detailTextLabel!.text = "Lorem \(outputWords[self.currentCell])"
                            }
                        }
                    self.currentCell += 1
                    } else {
                    print("Cannot unwrap the model.")
                }

                return cell
    }

    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return "Lorem Chat History"
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
