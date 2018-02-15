//
//  NibElementTableViewController.swift
//  AC3.2-MidtermElements
//
//  Created by Victor Zhong on 12/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class NibElementTableViewController: UITableViewController {

    lazy var elements = ElementTableViewController.elements
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "NibElementTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "nibElementCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nibElementCell", for: indexPath) as! NibElementTableViewCell
        let element = elements[indexPath.row]
        
        cell.elementLabel.text = element.name
        
        APIRequestManager.manager.getData(endPoint: "https://s3.amazonaws.com/ac3.2-elements/\(element.symbol)_200.png") { data in
            if let validData = data,
                let image = UIImage(data: validData) {
                
                DispatchQueue.main.async {
                    cell.elementImage?.image = image
                    cell.setNeedsLayout()
                }
            }
        }


        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as! ElementViewController
        vc.element = elements[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
