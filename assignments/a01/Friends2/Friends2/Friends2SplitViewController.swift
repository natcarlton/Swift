//
//  Friends2SplitViewController.swift
//  Friends2
//
//  Created by Natasha Carlton on 2/28/23.
//

import UIKit

class Friends2SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self)
        if let lContainerSplitViewController = self.splitViewController {
            print("lContainerSplitViewController")
            
            
            if let lSiblingSplitViewControllers = lContainerSplitViewController.navigationController {
            
                print("lSiblingSplitViewControllers.viewControllers[0]")
                print("lSiblingSplitViewControllers.viewControllers[1]")
                
                if let lTableViewControler = lSiblingSplitViewControllers.viewControllers[1] as? UITableViewController {
                    if let lTableView = lTableViewControler.view as? UITableView {
                        lTableView.reloadData()
                    }
                }
            }
        }

        // Do any additional setup after loading the view.
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
