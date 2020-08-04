//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Abdualziz Aljuaid on 04/08/2020.
//  Copyright © 2020 Abdualziz Aljuaid. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = self.view.frame.height / 10
        tableView.separatorStyle = .singleLine
    }
    
    //MARK:- TableView DataSource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        
        return cell
    }


    //MARK:- TableView Delegate Methods
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            self.updateModel(at: indexPath)
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        //options.transitionStyle = .border
        return options
    }

    //MARK:- Update Model
    func updateModel(at indexPath: IndexPath){
        //update model here.
    }
}
