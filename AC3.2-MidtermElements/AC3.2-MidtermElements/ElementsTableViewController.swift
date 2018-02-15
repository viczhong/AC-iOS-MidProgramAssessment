//
//  ElementsTableViewController.swift
//  AC3.2-MidtermElements
//
//  Created by Victor Zhong on 12/8/16.
//  Copyright © 2016 Victor Zhong. All rights reserved.
//

import UIKit

class ElementsTableViewController: UITableViewController {
    
    let cellIdentifier = "elementCellReuse"
    let cellSegue = "elementSegue"
    let optionsSegue = "optionsSegue"
    var elements = [Element]()
    var myName = "Vic Zhong"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        APIRequestManager.manager.getData(endPoint: "https://api.fieldbook.com/v1/5a29757f9b3fec0300e1a68c/elements") { (data: Data?) in
            if  let validData = data,
                let validElements = Element.elements(from: validData) {
                print("We have elements! \(validElements.count)")
                self.elements = validElements
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ElementTableViewCell
        let cellElement = elements[indexPath.row]
        cell.imageView?.image = nil
        cell.titleLabel.text = cellElement.name
        cell.subtitleLabel.text = "\(cellElement.symbol)(\(cellElement.number)) \(cellElement.weight)"


        APIRequestManager.manager.getData(endPoint: cellElement.thumb) { (data: Data?) in
            if let validData = data,
                let validImage = UIImage(data: validData) {
                DispatchQueue.main.async {
                    cell.imageView?.image = validImage
                    cell.setNeedsLayout()
                }
            }
        }

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailView = segue.destination as? DetailViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            detailView.element = elements[indexPath.row]
            detailView.name = myName
        }
        
        if let optionsView = segue.destination as? OptionsViewController {
            optionsView.delegate = self
            optionsView.name = myName
        }
    }
}

extension ElementsTableViewController: OptionsDelegate {
    func changeSettings(_ controller: OptionsViewController, _ name: String) {
        if myName != name {
            myName = name
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
}
