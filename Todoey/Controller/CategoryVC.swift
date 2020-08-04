//
//  CategoryVC.swift
//  Todoey
//
//  Created by Abdualziz Aljuaid on 30/07/2020.
//  Copyright © 2020 Abdualziz Aljuaid. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryVC: SwipeTableViewController {

    //good way to declare a realm obj
    let realm = try! Realm()
    var categories: Results<Category>?

    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    //MARK:- Add New Category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add category", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textFiled.text!
            //no need to append anymore cuz it auto-updating
            //self.categories.append(newCategory)
            self.save(category: newCategory)
            //self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Category"
            textFiled = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK:- TableView DataSource Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category added yet"
        
        return cell
    }
    
    //MARK:- TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoesVC
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK:- Data Manipulation Methods
    func save(category: Category){
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
           print("Error Saving Category \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories(){
        categories = realm.objects(Category.self)
    }
    
    //MARK:- Delete Data From Swipe
    override func updateModel(at indexPath: IndexPath) {
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error Deleting Category, \(error)")
            }
        }
    }
}

